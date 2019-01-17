import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.googleGreen,
        title: Text("Resources"),
        elevation: 0.0,
      ),
      body: Container(
        color: Utils.googleGreen,
      )
    );
  }
}