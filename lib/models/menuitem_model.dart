import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class MenuItemModel {
  IconData menuIcon;
  String menuLabel;
  String subLabel;
  PageTypes pageRef;
  Color menuColor;

  MenuItemModel({
    this.menuIcon,
    this.menuLabel,
    this.subLabel,
    this.pageRef,
    this.menuColor
  });
}