import 'package:cuddler/classes/theme.dart';
import 'package:flutter/material.dart';
import 'package:cuddler/screens/new_profile_screen.dart';
import 'package:cuddler/screens/select_location_screen.dart';
import 'package:cuddler/screens/update_status_screen.dart';
import 'package:cuddler/screens/user_profile_screen.dart';

class tempHome extends StatefulWidget {
  // static const routeName = '/update_status_screen';
  static const routeName = '/';
  @override
  tempHomeState createState() => tempHomeState();
}

class tempHomeState extends State<tempHome> {
  @override
  void initState() {
    super.initState();
  }

  void pushViewEntry(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(
      routeName,
      // arguments:
    );
  }

  var dropdownItems = ['Available', 'Pending', 'Not Available', 'Adopted'];

  var currentVal = null;
  var currentPet = "Lassie";
  var currentStatus = "Available";

  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: cuddlerAppBar(context, 'Select a Location'),
        appBar: AppBar(
          title: Text('Change the Status of Your Pet'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 50),
              ElevatedButton(
                child: Text("Profile Settings"),
                onPressed: () {
                  pushViewEntry(context, UserProfile.routeName);
                },
                style: ElevatedButton.styleFrom(
                    primary: colRed, // background
                    onPrimary: Colors.white, // foreground
                    textStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text("List Animal"),
                onPressed: () {
                  pushViewEntry(context, NewProfile.routeName);
                },
                style: ElevatedButton.styleFrom(
                    primary: colRed, // background
                    onPrimary: Colors.white, // foreground
                    textStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text("Select Location"),
                onPressed: () {
                  pushViewEntry(context, SelectLocation.routeName);
                },
                style: ElevatedButton.styleFrom(
                    primary: colRed, // background
                    onPrimary: Colors.white, // foreground
                    textStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
        ));
  }
}
