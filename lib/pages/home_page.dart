import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Image.asset('assets/gdg_just_text.png', width: 100),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/gdg_logo.png', width: 50),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Image.asset('assets/gdg_just_text.png', width: 120),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: Utils.getAllMenus(context),
              )
            ),
            Opacity(
              opacity: 0.3,
              child: Image.asset('assets/lawrence_sillouette.png'),
            )
          ],
        ),
      ),
    );
  }
}
