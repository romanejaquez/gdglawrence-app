
import 'package:flutter/material.dart';

class SpinningControl extends StatefulWidget {

  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color singleColor;

  

  SpinningControl({this.color1, this.color2, this.color3, this.color4});

  @override
  State<StatefulWidget> createState() {
    return SpinningControlState();
  }
}

class SpinningControlState extends State<SpinningControl> with SingleTickerProviderStateMixin
{
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, 
        duration: Duration(milliseconds: 2000)
    );
    
    animationController.repeat();
  }

  @override
  void dispose() {
      animationController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
      RotationTransition(
        alignment: Alignment.center,
        turns: new Tween(begin: 0.0, end: 1.0).animate(animationController),
        child: Padding(
            padding: EdgeInsets.all(50),
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
                      color: widget.color1
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 20, height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color2
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 20, height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color3
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 20, height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color4
                    ),
                  ),
                )
              ],
            ),
          )
          )
        );
  }
  
}