import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/widgets/user_profile_widgets.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  static const routeName = '/user_profile_screen';
  // static const routeName = '/';
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
  }

  var dropdownItems = ['Available', 'Pending', 'Not Available', 'Adopted'];

  var currentVal = "Select Status";
  var currentPet = "Lassie";
  var currentStatus = "Available";

  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: cuddlerAppBar(context, 'Select a Location'),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: buildUserProfileBody(context),
      // == Floating Action Button ==
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Log Out'),
          icon: const Icon(Icons.logout),
          backgroundColor: colDarkBlue,
        ),
      ),
    );
  }
}
