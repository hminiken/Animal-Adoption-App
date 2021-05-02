import 'package:flutter/material.dart';
import '../models/constants.dart';

class LandingButton extends StatelessWidget {
  LandingButton({required this.displayText, required this.page});
  //final GestureTapCallback onPressed;
  final String displayText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Constants.fadedOrange,
        splashColor: Constants.redOrange,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.home_rounded,
                color: Constants.deepBlue,
              ),
              SizedBox(width: 8.0),
              Text(
                displayText,
                style: TextStyle(
                  color: Constants.deepBlue,
                  fontFamily: 'Solway',
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
        ),
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        });
  }
}
