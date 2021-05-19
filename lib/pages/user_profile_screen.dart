import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cuddler/pages/user_listed_pets.dart';
import 'package:cuddler/pages/about_cuddler_screen.dart';
import 'package:cuddler/pages/email_preferences.dart';
import 'package:cuddler/pages/user_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:cuddler/widgets/global_widgets.dart';

import '../models/constants.dart';
import '../pages/user_info_screen.dart';
import '../widgets/global_widgets.dart';

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
    getUserImage();
  }

  void pushViewEntry(BuildContext context, String routeName) {
    Navigator.of(context)
        .pushNamed(
          routeName,
          // arguments:
        )
        .then((value) => setState(() {
              getUserImage();
            }));

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondPage()),
    // ).then((value) => setState(() {}));
  }

  final List<String> profileOptions = [
    'View My Listed Pets',
    'Edit My Information',
    'Email Preferences',
    'About Cuddler™'
  ];
  final List<String> optionRoute = [
    UserListed.routeName,
    UpdateUserInfo.routeName,
    EmailPreferences.routeName,
    AboutCuddler.routeName,
  ]; //last two are place holders, screens not created yet

  getUserImage() async {
    final user = FirebaseAuth.instance.currentUser!;
    String userEmail = user.email!;

    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        url = documentSnapshot.get("profileImgURL");
        userName = documentSnapshot.get("fName");
      } else {
        print('Document does not exist on the database');
      }
    });

    setState(() {});
    print(url);
  }

  var dropdownItems = ['Available', 'Pending', 'Not Available', 'Adopted'];

  var currentVal = "Select Status";
  var currentPet = "Lassie";
  var currentStatus = "Available";

  String url = "", userName = "";

  Widget buildUserProfileBody(BuildContext context) {
    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 500
            ? verticalLayout(context)
            : horizontalLayout(context);
      }),
      SizedBox(height: 10),
      Expanded(
          child: ListView.builder(
              itemCount: profileOptions.length,
              itemBuilder: (context, index) {
                return buildListItem(context, index);
              })),
      SizedBox(height: 20),
    ]);
  }

  Widget buildListItem(BuildContext context, int index) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: (Colors.grey[300])!))),
            child: ListTile(
              title: Text(
                profileOptions[index],
                style: textTheme.subtitle1,
              ),
              onTap: () => pushViewEntry(context, optionRoute[index]),
            )));
  }

  Widget verticalLayout(BuildContext context) {
    return Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Constants.fadedYellow,
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image.network(
                url,
                height: 125.0,
                width: 125.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerText(context, userName, Colors.white, 24),
          SizedBox(height: 5),
          centerText(context, '5 Pets Adopted', Colors.white, 14),
          SizedBox(height: 25),
        ]),
        decoration: BoxDecoration(
            color: Constants.redOrange,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(300, 75),
                bottomRight: Radius.elliptical(300, 75))));
  }

  Widget horizontalLayout(BuildContext context) {
    return Container(
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Constants.fadedYellow,
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Image.network(
                        url,
                        height: 75.0,
                        width: 75.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      centerText(context, 'Hillary', Colors.white, 24),
                      centerText(context, '5 Pets Adopted', Colors.white, 14),
                    ],
                  )
                ],
              ))
        ]),
        decoration: BoxDecoration(
            color: Constants.redOrange,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(100, 75),
                bottomRight: Radius.elliptical(100, 75))));
  }

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
          backgroundColor: Constants.deepBlue,
        ),
      ),
    );
  }
}
