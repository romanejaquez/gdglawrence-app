import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdg_lawrence/models/event_model.dart';
import 'package:gdg_lawrence/models/homescreen_model.dart';
import 'package:gdg_lawrence/models/member_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';

class Utils {

  static const Color googleRed = Color.fromRGBO(216, 65, 53, 1.0);
  static const Color googleBlue = Color.fromRGBO(85, 126, 191, 1.0);
  static const Color googleGreen = Color.fromRGBO(22, 157, 85, 1.0);
  static const Color googleYellow = Color.fromRGBO(250, 200, 67, 1.0);

  static List<Widget> getAllMenus(BuildContext context, HomeScreenModel data) {
    return Repository.getMenuItemModels(data).map((m) => Factory.getMenuItemWidget(context, m)).toList();
  }
}

enum PageTypes {
  Home,
  Members,
  Events,
  Resources,
  Notifications
}