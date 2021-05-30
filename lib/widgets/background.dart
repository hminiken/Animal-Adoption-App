import 'package:flutter/material.dart';
import '../models/constants.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.7, 0.9],
          colors: [
            Colors.white,
            (Colors.teal[100])!,
            (Colors.teal[300])!,
            Constants.tealBlue,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      child: Container(
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

Widget fadedBackground(BuildContext context) {
  return Stack(
    children: [
      Image.asset(
        'assets/images/faded-background.png',
        fit: BoxFit.cover,
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / ,
      ),
      //top grey shadow
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              end: const Alignment(0.0, 0.4),
              begin: const Alignment(0.0, -1),
              colors: <Color>[
                const Color(0x8A000000),
                Colors.white.withOpacity(0.0)
              ],
            ),
          ),
        ),
      ),
      //bottom grey shadow
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              end: const Alignment(0.0, -1.5),
              begin: const Alignment(0.0, 0.1),
              colors: <Color>[
                Colors.white.withOpacity(0.99),
                Colors.white.withOpacity(0.0)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
