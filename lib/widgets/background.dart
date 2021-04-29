import 'package:flutter/material.dart';
import '../models/constants.dart';

class Background extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.7, 0.9],
          colors: [
            Colors.white,
            Colors.teal[100],
            Colors.teal[300],
            Constants.tealBlue,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      child:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/geometric-background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
