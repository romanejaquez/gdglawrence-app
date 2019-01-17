import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/member_model.dart';
import 'package:gdg_lawrence/models/menuitem_model.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:http/http.dart' as http;

class Repository {
  
  static const String API_KEY = '2554255606c801d137037537f31539';

  static Future<List<EventModel>> getAllEvents() async {

    var allEvents = List<EventModel>();
    var url = 'https://api.meetup.com/GDG-Lawrence/events?&sign=true&photo-host=public&page=20&desc=true';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allEvents = createEvents(responseJSON);

    return allEvents;
  }

  static Future<List<MemberModel>> getAllMembers() async {

    var allMembers = List<MemberModel>();
    var url = 'https://api.meetup.com/GDG-Lawrence/members?&sign=true&photo-host=public&page=20?key=${API_KEY}';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allMembers = createMembers(responseJSON);

    return allMembers;
  }

  static List<MemberModel> createMembers(List data) {
    var members = List<MemberModel>();

    for(var i = 0; i < data.length; i++) {
      members.add(
        MemberModel(
          name: data[i]["name"],
          role: data[i]["group_profile"]["role"] != null ? data[i]["group_profile"]["role"] : 'member',
          photo: data[i]["photo"] != null ? data[i]["photo"]["thumb_link"] : 'https://secure.meetupstatic.com/img/noPhoto_50.png',
          city: data[i]["city"],
          state: data[i]["state"],
          country: data[i]["localized_country_name"]
        )
      );
    }

    return members;
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