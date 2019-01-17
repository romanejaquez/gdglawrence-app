import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Utils.googleYellow,
        title: Text("Notifications",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Utils.googleYellow,
      )
    );
  }
}