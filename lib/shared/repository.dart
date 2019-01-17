import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/menuitem_model.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:http/http.dart' as http;

class Repository {

  static Future<List<EventModel>> getAllEvents() async {

    var allEvents = List<EventModel>();
    var url = 'https://api.meetup.com/GDG-Lawrence/events?&sign=true&photo-host=public&page=20&desc=true';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allEvents = createEvents(responseJSON);
    
    return allEvents;
  }

  static List<EventModel> createEvents(List data) {
    var events = List<EventModel>();

    for(var i = 0; i < data.length; i++) {
      events.add(
        EventModel(
          eventName: data[i]["name"],
          eventDate: data[i]["local_date"],
          eventTime: data[i]["local_time"],
          attendeeCount: data[i]["yes_rsvp_count"].toString()
        )
      );
    }

    return events;
  }

  static List<MenuItemModel> getMenuItemModels() {

    var menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleRed,
        menuIcon: Icons.date_range,
        subLabel: "3 Events",
        menuLabel: "Upcoming / Past Events",
        pageRef: PageTypes.Events
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleBlue,
        menuIcon: Icons.group,
        subLabel: "52 Members",
        menuLabel: "Members",
        pageRef: PageTypes.Members
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleGreen,
        menuIcon: Icons.build,
        subLabel: "42 Links",
        menuLabel: "Resources",
        pageRef: PageTypes.Resources
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleYellow,
        menuIcon: Icons.notification_important,
        subLabel: "10 Notifications",
        menuLabel: "Notifications",
        pageRef: PageTypes.Notifications
      )
    );
    return menuItems;
  }
}