import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EventDetailsPage extends StatefulWidget {
  EventModel event;
  bool isFuture;

  EventDetailsPage({this.event, this.isFuture});
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
  
  EventDetailsStatePage({this.event});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return Scaffold(
      floatingActionButton: widget.isFuture ? FloatingActionButton(
        backgroundColor: Utils.googleRed,
        child: Icon(Icons.share, color: Colors.white),
        onPressed: () {
          Share.share(event.link);
        },
      ) : null,
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
                      Text("${event.attendeeCount} people " + (widget.isFuture ? "going" : "attended"),
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
            Divider(
              color: Colors.grey,
              height: 15,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  widget.isFuture ? Column(
                    children: <Widget>[
                    Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text("Share QRCode Below", style:TextStyle(color: Colors.grey, fontSize: 11)),
                  ),
                  Padding(padding: EdgeInsets.all(20), 
                  child: 
                    Container(padding: EdgeInsets.all(5),
                    child: QrImage(data:event.link, size: 150),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Colors.grey[300], blurRadius: 10, offset: Offset.zero)
                        ]
                      ),
                      )
                    )
                  ]) : Center(child: Text('This event has passed already.', style:TextStyle(fontSize: 14, color: Colors.grey))),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: widget.isFuture ? Utils.googleRed : Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset('assets/meetup_logo_white.png', width: 40, height: 40)
                            ),
                            Text(widget.isFuture ? "Go to Meetup Page To Register" : "View this past event",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onPressed: () async {
                        await launch(event.link);
                      },
                    ),
                  )]
              )
            )
          ],
        ),
      ),
    );
  }
}