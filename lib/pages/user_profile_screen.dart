import 'package:cuddler/classes/theme.dart';
import 'package:cuddler/widgets/user_profile_widgets.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  static const routeName = '/user_profile_screen';
  // static const routeName = '/';
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Future<bool> _goToLogin(BuildContext context) {
    //save session state?
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

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
            _goToLogin(context);
          },
          label: const Text('Log Out'),
          icon: const Icon(Icons.logout),
          backgroundColor: colDarkBlue,
        ),
      ),
    );
  }
}
