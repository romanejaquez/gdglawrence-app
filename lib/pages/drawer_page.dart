import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:gdg_lawrence/pages/contactus_page.dart';
import 'package:gdg_lawrence/pages/team_page.dart';

class DrawerContent extends StatelessWidget {
  
  @override 
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => TeamPage()));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.people, color: Colors.grey),
                  Padding(
                    child: Text("Our team"),
                    padding: EdgeInsets.only(left: 15),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ContactPage()));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.contacts, color: Colors.grey),
                  Padding(
                    child: Text("Contact Us"),
                    padding: EdgeInsets.only(left: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}