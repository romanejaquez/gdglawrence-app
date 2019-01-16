import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(home: SplashPage(), debugShowCheckedModeBanner: false));

class Utils {
  static const Color googleRed = Color.fromRGBO(216, 65, 53, 1.0);
  static const Color googleBlue = Color.fromRGBO(85, 126, 191, 1.0);
  static const Color googleGreen = Color.fromRGBO(22, 157, 85, 1.0);
  static const Color googleYellow = Color.fromRGBO(250, 200, 67, 1.0);
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageStateful();
  }
}

class SplashPageStateful extends State<SplashPage> with SingleTickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {

    Timer.run(() {
      new Timer(new Duration(days: 0, hours: 0, minutes: 0, seconds: 3, microseconds: 0, milliseconds: 0), () {
        animationController.dispose();
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
                RotationTransition(
                  alignment: Alignment.center,
                  turns: new Tween(begin: 0.0, end: 1.0).animate(animationController),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                      width: 75, height: 75,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 20, height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Utils.googleBlue
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 20, height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Utils.googleYellow
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 20, height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Utils.googleGreen
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 20, height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Utils.googleRed
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    )
              )
              ],
            ),
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
            Padding(
              padding: EdgeInsets.only(left: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.group, color: Utils.googleBlue, size: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Members',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Utils.googleBlue,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text('52 Members',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.group, color: Utils.googleGreen, size: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Resources',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Utils.googleGreen,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text('42 Links',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
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
