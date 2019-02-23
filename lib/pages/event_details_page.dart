import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class EventDetailsPage extends StatefulWidget {
  EventModel event;

  EventDetailsPage({this.event});
  @override
  State<StatefulWidget> createState() {
    return EventDetailsStatePage(event: event);
  }
}

class EventDetailsStatePage extends State<EventDetailsPage> {
  
  EventModel event;
  var someShit = parse("<b>Hello world!!!</b>");
  static TextSpan span = TextSpan(text: "asdfds", style: TextStyle(color: Colors.black));
  RichText richContent = RichText(text: span);

  GoogleMapController mapController;
  final LatLng _center = const LatLng(42.71071243286133, -71.16216278076172);
  
  EventDetailsStatePage({this.event});

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.addMarker(
      MarkerOptions(
        consumeTapEvents: false,
        position: _center,
        icon: BitmapDescriptor.defaultMarker
      )
    );

    //mapController.animateCamera(CameraUpdate.scrollBy(-200.0,-100.0));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Utils.googleRed,
        child: Icon(Icons.share, color: Colors.white),
        onPressed: () {
          Share.share(event.link);
        },
      ),
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Utils.googleRed,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(event.eventName,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.date_range, color: Colors.grey),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(DateFormat.yMMMd('en_US').format(DateTime.parse(event.eventDate)),
                            style: TextStyle(color: Colors.grey)
                      ),
                      Text(DateFormat.jm().format(DateTime.parse(event.eventDate + ' ' + event.eventTime)),
                        style: TextStyle(color: Colors.grey)
                      ),
                      Text("${event.attendeeCount} people going",
                        style: TextStyle(color: Utils.googleRed)
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.location_on, color: Utils.googleRed),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(event.venueName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Utils.googleRed)
                      ),
                      Text(event.venueAddress),
                      Text(event.venueCity + ", " + event.venueState + " " + event.venueZip)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                height: 200,
                child: GoogleMap(
                  onMapCreated: onMapCreated,
                  options: GoogleMapOptions(
                    trackCameraPosition: true,
                    cameraPosition: CameraPosition(
                      bearing: 270,
                      target: _center,
                      zoom: 15.0,
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Utils.googleRed,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset('assets/meetup_logo_white.png', width: 40, height: 40)
                      ),
                      Text("Go to Meetup Page To Register",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onPressed: () async {
                  await launch(event.link);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}