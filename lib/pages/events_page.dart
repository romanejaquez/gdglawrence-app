import 'package:flutter/material.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/event_model.dart';
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

  List<EventModel> events;
  List<Widget> eventWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllEvents().then((e) {
      setState(() {
          events = e;
          eventWidgets = List<Widget>();
          
          for(var i = 0; i < events.length; i++) {
            eventWidgets.add(Factory.getEventWidget(events[i]));
          }
      });
    });
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
          body: events != null ? TabBarView(
            children: <Widget>[
              ListView(
                children: eventWidgets
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