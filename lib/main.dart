import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(home: SplashPage(), debugShowCheckedModeBanner: false));

class Utils {
  static const Color googleRed = Color.fromRGBO(216, 65, 53, 1.0);
  static const Color googleBlue = Color.fromRGBO(85, 126, 191, 1.0);
  static const Color googleGreen = Color.fromRGBO(22, 157, 85, 1.0);
  static const Color googleYellow = Color.fromRGBO(250, 200, 67, 1.0);
}
class SplashPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {

    Timer.run(() {
      new Timer(new Duration(days: 0, hours: 0, minutes: 0, seconds: 2, microseconds: 0, milliseconds: 0), () {
        
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => HomePage()));

      });
    });

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/gdg_logo.png', width: 120.0),
                Padding(padding: EdgeInsets.only(top: 10),
                  child: Image.asset('assets/gdg_just_text.png', width: 150.0)),
                Padding(padding: EdgeInsets.only(top: 40.0),
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.grey[300]),
                    strokeWidth: 5.0
                    ),),
              ],
            ),
          ),
          Align(
            child: Padding(
              child: Image.asset('assets/gdg_just_tech.png'),
              padding: EdgeInsets.only(bottom: 40, left: 80, right: 80),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.date_range, color: Utils.googleRed, size: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Upcoming Events',
                            style: TextStyle(
                              fontSize: 18,
                              color: Utils.googleRed,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('3 Events',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                            )
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Opacity(
              opacity: 0.3,
              child: Image.asset('assets/lawrence_sillouette.png'),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
