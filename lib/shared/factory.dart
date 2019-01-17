
import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/menuitem_model.dart';
import 'package:gdg_lawrence/pages/events_page.dart';
import 'package:gdg_lawrence/pages/home_page.dart';
import 'package:gdg_lawrence/pages/members_page.dart';
import 'package:gdg_lawrence/pages/notifications_page.dart';
import 'package:gdg_lawrence/pages/resources_page.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class Factory {


  static Widget getEventWidget(EventModel event) {

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.date_range, color: Utils.googleRed, size: 40),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Text(event.eventName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Text(event.eventDate,
                    style: TextStyle(color: Colors.grey)
                  ),
                  Text(event.eventTime,
                    style: TextStyle(color: Colors.grey)
                  ),
                  Text("${event.attendeeCount} people going",
                    style: TextStyle(color: Utils.googleRed)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget getPageType(PageTypes type) {
    Widget pageWidget;
    
    switch(type) {
      case PageTypes.Events:
        pageWidget = EventsPage();
        break;
      case PageTypes.Home:
        pageWidget = HomePage();
        break;
      case PageTypes.Members:
        pageWidget = MembersPage();
        break;
      case PageTypes.Notifications:
        pageWidget = NotificationsPage();
        break;
      case PageTypes.Resources:
        pageWidget = ResourcesPage();
        break;
    }

    return pageWidget;
  }

  static Widget getMenuItemWidget(BuildContext context, MenuItemModel model) {
    return 
      InkWell(
        highlightColor: Colors.grey[300],
        onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => getPageType(model.pageRef)));
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(model.menuIcon, color: model.menuColor, size: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(model.menuLabel,
                          style: TextStyle(
                            fontSize: 18,
                            color: model.menuColor,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(model.subLabel,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
              Icon(Icons.keyboard_arrow_right, size: 40, color: Colors.grey)
            ],
          ),
        )
      );
  }
}