import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/homescreen_model.dart';
import 'package:gdg_lawrence/models/member_model.dart';
import 'package:gdg_lawrence/models/menuitem_model.dart';
import 'package:gdg_lawrence/models/podcast_model.dart';
import 'package:gdg_lawrence/models/resource_model.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:http/http.dart' as http;

class Repository {
  
  static const String API_KEY = '2554255606c801d137037537f31539';

  static Future<HomeScreenModel> getHomeScreenData() async {

    var url = 'https://us-central1-gdglawrence.cloudfunctions.net/getHomeScreenData';
    var response = await http.get(url);
    dynamic responseJSON = jsonDecode(response.body);
    return HomeScreenModel(
      eventsCount: responseJSON["events"],
      podcastsCount: responseJSON["podcasts"],
      membersCount: responseJSON["members"],
      resourcesCount: responseJSON["resources"]
    );
  }

  static Future<List<EventModel>> getAllEvents() async {

    var allEvents = List<EventModel>();
    var url = 'https://api.meetup.com/GDG-Lawrence/events?&sign=true&photo-host=public&page=20&desc=true';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allEvents = createEvents(responseJSON);

    return allEvents;
  }

  static Future<List<ResourceModel>> getAllResources() async {

    var allResources = List<ResourceModel>();
    var url = 'https://us-central1-gdglawrence.cloudfunctions.net/getResources';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allResources = createResources(responseJSON);

    return allResources;
  }

  static Future<List<MemberModel>> getAllMembers() async {

    var allMembers = List<MemberModel>();
    var url = 'https://api.meetup.com/GDG-Lawrence/members?&sign=true&photo-host=public&page=20?key=${API_KEY}';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allMembers = createMembers(responseJSON);

    return allMembers;
  }

  static Future<List<PodcastModel>> getAllPodcasts() async {

    var allPodcasts = List<PodcastModel>();
    var url = 'http://api.drcoderz.com/flutter/gdglawrence/minipodcasts/podcasts.php';
    var response = await http.get(url);
    List responseJSON = jsonDecode(response.body);
    allPodcasts = createPodcasts(responseJSON);

    return allPodcasts;
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

  static List<ResourceModel> createResources(List data) {
    var resources = List<ResourceModel>();

    for(var i = 0; i < data.length; i++) {
      resources.add(
        ResourceModel(
          title: data[i]["title"],
          description: data[i]["description"],
          link: data[i]["link"],
          resourceType: data[i]["resourceType"],
        )
      );
    }

    return resources;
  }

  static List<EventModel> createEvents(List data) {
    var events = List<EventModel>();

    for(var i = 0; i < data.length; i++) {
      events.add(
        EventModel(
          eventName: data[i]["name"],
          eventDate: data[i]["local_date"],
          eventTime: data[i]["local_time"],
          attendeeCount: data[i]["yes_rsvp_count"].toString(),
          isVenueAssigned: data[i]["venue"] != null,
          venueName: data[i]["venue"] != null ? data[i]["venue"]["name"] : "",
          venueAddress: data[i]["venue"] != null ? data[i]["venue"]["address_1"] : "",
          venueCity: data[i]["venue"] != null ? data[i]["venue"]["city"] : "",
          venueState: data[i]["venue"] != null ? data[i]["venue"]["state"] : "",
          venueZip: data[i]["venue"] != null ? data[i]["venue"]["zip"] : "",
          lat: data[i]["venue"] != null ? data[i]["venue"]["lat"] : 0.0,
          long: data[i]["venue"] != null ? data[i]["venue"]["long"] : 0.0,
          link: data[i]["link"]
        )
      );
    }

    return events;
  }

  static List<PodcastModel> createPodcasts(List data) {
    var events = List<PodcastModel>();

    for(var f = 0; f < data.length; f++) {
      var jsonPodcasts = data[f]["Podcasts"];

      for(var i = 0; i < jsonPodcasts.length; i++) {
        events.add(
          PodcastModel(
            name: jsonPodcasts[i]["Name"],
            path: jsonPodcasts[i]["Path"],
            durationInSeconds: jsonPodcasts[i]["DurationInSeconds"],
            duration: jsonPodcasts[i]["Duration"],
            id: jsonPodcasts[i]["Id"],
            index: jsonPodcasts[i]["Index"]
          )
        );
      }
    }

    return events;
  }

  static List<MenuItemModel> getMenuItemModels(HomeScreenModel data) {

    var menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleRed,
        menuIcon: Icons.date_range,
        subLabel: "${data.eventsCount} Events",
        menuLabel: "Upcoming / Past Events",
        pageRef: PageTypes.Events
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleBlue,
        menuIcon: Icons.group,
        subLabel: "${data.membersCount} Members",
        menuLabel: "Members",
        pageRef: PageTypes.Members
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleGreen,
        menuIcon: Icons.build,
        subLabel: "${data.resourcesCount} Links",
        menuLabel: "Resources",
        pageRef: PageTypes.Resources
      )
    );

    menuItems.add(
      MenuItemModel(
        menuColor: Utils.googleYellow,
        menuIcon: Icons.record_voice_over,
        subLabel: "${data.podcastsCount} Podcasts Posted",
        menuLabel: "Mini Podcasts",
        pageRef: PageTypes.Notifications
      )
    );
    return menuItems;
  }
}