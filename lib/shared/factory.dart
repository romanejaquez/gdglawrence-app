
import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/resource_model.dart';
import 'package:intl/intl.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/member_model.dart';
import 'package:gdg_lawrence/models/menuitem_model.dart';
import 'package:gdg_lawrence/models/podcast_model.dart';
import 'package:gdg_lawrence/pages/events_page.dart';
import 'package:gdg_lawrence/pages/home_page.dart';
import 'package:gdg_lawrence/pages/members_page.dart';
import 'package:gdg_lawrence/pages/notifications_page.dart';
import 'package:gdg_lawrence/pages/resources_page.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class Factory {

  static Widget getMemberWidget(MemberModel member) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    color: Colors.grey[300],
                    width: 80,
                    height: 80,
                    child: Image.network(member.photo)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(member.name,
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      Text(member.role,
                        style: TextStyle(color: Colors.grey)
                      ),
                      Text("${member.city} ${member.state} (${member.country})",
                        style: TextStyle(color: Utils.googleBlue)
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
      ),
    );
  }

  static Widget getResourceWidget(ResourceModel resource, Function onSelectedResource) {
    return InkWell(
      onTap: () {
        onSelectedResource(resource);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.link, color: Utils.googleGreen),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(resource.title,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                        Text(resource.description,
                          style: TextStyle(color: Colors.black)
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
      ),
    );
  }

  static Widget getPodcastRowWidget(PodcastModel podcast, Function selectedPodcastFunc) {
    return GestureDetector(
      onTap: () {
        selectedPodcastFunc(podcast);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:10, right: 10, bottom: 0),
                child: Icon(Icons.record_voice_over, color: Colors.white, size: 40)
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(podcast.name,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                      ),
                      Text(podcast.duration,
                        style: TextStyle(color: Colors.white, fontSize: 10)
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Icon(Icons.graphic_eq, size: 30, color: Colors.white),
              )
            ],
          ),
        ),
      )
    );
  }

  static Widget getEventWidget(EventModel event, Function eventCallback) {

    return InkWell(
      onTap: () {
        eventCallback(event);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 40,
                    child: Image.asset('assets/meetup_logo.png'),
                  ),
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
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
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