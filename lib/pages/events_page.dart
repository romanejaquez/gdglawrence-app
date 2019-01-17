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
  List<Widget> pastEventWidgets = List<Widget>();

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
              ),
              ListView(
                children: <Widget>[
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
                          Text("No Upcoming Events",
                            style: TextStyle(color: Colors.grey)
                          )
                        ],
                      ),
                    ),
                  )
                ]
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