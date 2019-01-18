import 'package:flutter/material.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Utils.googleYellow,
        title: Text("Mini Podcasts",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Utils.googleYellow,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.only(left:5, top: 15, bottom: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:10, right: 10, bottom: 10),
                      child: Icon(Icons.record_voice_over, color: Colors.white, size: 40)
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Flutter Latest Version',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        Text('Jan 19, 10:00 AM - Roman Jaquez',
                          style: TextStyle(color: Colors.white, fontSize: 10)
                        ),
                        Row(
                          children: <Widget>[
                            Text('0:00',
                              style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                            Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.black,
                              onChanged: (val) {},
                              value: 0
                            ),
                            Text('1:00',
                              style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Icon(Icons.graphic_eq, size: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.only(left:5, top: 15, bottom: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:10, right: 10, bottom: 10),
                      child: Icon(Icons.record_voice_over, color: Colors.white, size: 40)
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Flutter Latest Version',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        Text('Jan 19, 10:00 AM - Roman Jaquez',
                          style: TextStyle(color: Colors.white, fontSize: 10)
                        ),
                        Row(
                          children: <Widget>[
                            Text('0:00',
                              style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                            Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.black,
                              onChanged: (val) {},
                              value: 0
                            ),
                            Text('1:00',
                              style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Icon(Icons.graphic_eq, size: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}