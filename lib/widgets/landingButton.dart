import 'package:cuddler/pages/dashboard.dart';
import 'package:cuddler/pages/new_profile_screen.dart';
import 'package:flutter/material.dart';
import '../models/constants.dart';

class LandingButton extends StatelessWidget {
  LandingButton(
      {required this.displayText, required this.page, required this.icon});
  //final GestureTapCallback onPressed;
  final String displayText;
  final Widget page;
  final IconData icon;

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
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    icon,
                    color: Constants.deepBlue,
                  )),
              SizedBox(width: 8.0),
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Constants.deepBlue,
                      fontFamily: 'Solway',
                      fontSize: 24.0,
                    ),
                  )),
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

class LandingButtonNoClick extends StatelessWidget {
  LandingButtonNoClick({required this.displayText, required this.icon});
  //final GestureTapCallback onPressed;
  final String displayText;
  final IconData icon;

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
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    icon,
                    color: Constants.deepBlue,
                  )),
              SizedBox(width: 8.0),
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: Constants.deepBlue,
                      fontFamily: 'Solway',
                      fontSize: 32.0,
                    ),
                  )),
            ],
          ),
        ),
        shape: const StadiumBorder(),
        onPressed: () {
          DashboardScreenState()
              .pushViewListPet(context, NewProfile.routeName, false);
        });
  }
}
