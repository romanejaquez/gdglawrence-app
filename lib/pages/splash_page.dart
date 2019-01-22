import 'package:flutter/material.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/homescreen_model.dart';
import 'package:gdg_lawrence/pages/home_page.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(milliseconds: 1000), () {
      
      Repository.getHomeScreenData().then((HomeScreenModel homeData) {
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => HomePage(data: homeData)));
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
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset('assets/gdg_just_text.png', width: 150.0)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: SpinningControl(
                    color1: Utils.googleBlue,
                    color2: Utils.googleGreen,
                    color3: Utils.googleRed,
                    color4: Utils.googleYellow
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}