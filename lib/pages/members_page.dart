import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.googleBlue,
        title: Text("Members"),
        elevation: 0.0,
      ),
      body: Container(
        color: Utils.googleBlue,
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),
          child: ListView(
            children: <Widget>[

            ],
          ),
        ),
      )
    );
  }
}