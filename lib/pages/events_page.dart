import 'package:flutter/material.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/pages/event_details_page.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventsPageState();
  }
}

class EventsPageState extends State<EventsPage> {

  List<EventModel> pastEvents;
  List<EventModel> upcomingEvents;
  List<Widget> upcomingEventWidgets;
  List<Widget> pastEventWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllEvents().then((e) {
      setState(() {
          pastEvents = e.pastEvents;
          upcomingEvents = e.upcomingEvents;

          upcomingEventWidgets = List<Widget>();
          pastEventWidgets = List<Widget>();
          
          for(var i = 0; i < pastEvents.length; i++) {
            pastEventWidgets.add(Factory.getEventWidget(pastEvents[i], onSelectedEvent));
          }

          for(var i = 0; i < upcomingEvents.length; i++) {
            upcomingEventWidgets.add(Factory.getEventWidget(upcomingEvents[i], onSelectedEvent));
          }
      });
    });
  }

  List<Widget> getNoEventMessage(String msg) {
    return <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Icon(Icons.date_range, color: Colors.grey),
                  ),
                  Text(msg,
                    style: TextStyle(color: Colors.grey)
                  )
                ],
              ),
            ),
          )
        ];
  }

  void onSelectedEvent(EventModel event) {
    Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => EventDetailsPage(event: event)));
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Utils.googleRed,
            title: Text("Events"),
            elevation: 0.0,
            bottom: TabBar(
                labelColor: Colors.white,
                tabs: <Widget>[
                  Tab(text: "Upcoming",
                  icon: Icon(Icons.date_range)),
                  Tab(text: "Past", 
                  icon: Icon(Icons.calendar_today))
                ],
              ),
          ),
          body: (pastEvents != null || upcomingEvents != null) ? TabBarView(
            children: <Widget>[
              ListView(
                children: (upcomingEventWidgets != null && upcomingEventWidgets.length > 0) ? upcomingEventWidgets : getNoEventMessage("No Upcoming Events")
              ),
              ListView(
                children: (pastEventWidgets != null && pastEventWidgets.length > 0) ? pastEventWidgets : getNoEventMessage("No Past Events")
              )
            ],
          ) : Center(
            child: SpinningControl(
              color1: Utils.googleRed,
              color2: Utils.googleRed,
              color3: Utils.googleRed,
              color4: Utils.googleRed
            ),
          )
      ),
    );
  }
}