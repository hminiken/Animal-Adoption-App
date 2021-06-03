import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddler/models/animals.dart';
import 'package:cuddler/pages/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'admin_screen.dart';
import '../models/constants.dart';
import '../models/user_model.dart';
import '../widgets/background.dart';
import 'daily_feed.dart';
import 'select_location_screen.dart';
import '../widgets/landingButton.dart';
import '../widgets/transition_route_observer.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isAdmin = false;
  final routeObserver = TransitionRouteObserver<PageRoute>();
  var userName;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void pushViewEntry(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(
      routeName,
      // arguments:
    );
  }

  void pushViewListPet(BuildContext context, String routeName, bool isUpdate) {
    Navigator.of(context).pushNamed(routeName,
        arguments: Animals(
            about: "",
            age: 1,
            disposition1: false,
            disposition2: false,
            disposition3: false,
            email: "",
            name: "",
            phone: "",
            contactName: "",
            sex: "Male",
            url: "",
            breed: "",
            favorite: false,
            location: "Alabama",
            animalID: "",
            status: "",
            categoryName: "Dog",
            isUpdate: false));
  }

  CuddlerUser currentUser = new CuddlerUser(
      userID: "",
      fName: "",
      email: "",
      phoneNumber: "",
      accountType: 1,
      userLocation: "",
      profileImgURL: "");

  getUserInfo() async {
    currentUser = await currentUser.getUserData(user);

    setState(() {});
  }

  void decideAdmin() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((snap) {
      userName = snap.data()?['fName'];
      if (snap.data()?['accountType'] == 0) {
        isAdmin = true;
      }
    });
    setState(() {});
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      toolbarHeight: 50.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Cuddler',
        style: TextStyle(
          fontFamily: 'Solway',
          fontSize: 32.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: Constants.tealBlue,
      elevation: 0,
      textTheme: theme.accentTextTheme,
      iconTheme: theme.accentIconTheme,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              pushViewEntry(context, UserProfile.routeName);
            },
            child: Icon(
              Icons.person,
              size: 26.0,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    decideAdmin();
    return Scaffold(
      appBar: _buildAppBar(theme),
      body: Stack(
        children: [
          fadedBackground(context),
          LayoutBuilder(builder: layoutLanding),
        ],
      ),
      floatingActionButton: isAdmin ? adminButton(context) : null,
      floatingActionButtonLocation:
          isAdmin ? FloatingActionButtonLocation.centerFloat : null,
    );
  }

  final String adopt = 'Adopt a Pet';
  final String list = 'List a Pet';
  final String dailyFeed = 'Daily Feed';

  Widget layoutLanding(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500
          ? verticalLanding(context)
          : horizontalLanding(context);

  Widget verticalLanding(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30.0),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Image.asset('images/circleLogo.png'),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Cuddler',
                style: TextStyle(
                    fontFamily: 'OleoScriptSwashCaps',
                    fontSize: 38.0,
                    color: Constants.deepBlue),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Welcome, $userName',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Please choose an option',
                  style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 30.0,
                    color: Constants.deepBlue,
                  ),
                )),
          )),
          Expanded(
            child: LandingButtonNoClick(
              displayText: list,
              icon: Icons.upload_rounded,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width / 15),
          Expanded(
            child: LandingButton(
                displayText: adopt, page: SelectLocation(), icon: Icons.pets),
          ),
          SizedBox(height: MediaQuery.of(context).size.width / 15),
          Expanded(
            child: LandingButton(
                displayText: dailyFeed, page: DailyFeed(), icon: Icons.list),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }

  Widget horizontalLanding(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Image.asset('images/blueHeartLogo.png'),
              ),
              SizedBox(width: 20.0),
              Text(
                'Cuddler',
                style: TextStyle(
                    fontFamily: 'OleoScriptSwashCaps',
                    fontSize: 38.0,
                    color: Constants.deepBlue),
              ),
            ],
          ),
          Expanded(
            child: Text(
              'Please choose an option',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 30.0,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: LandingButtonNoClick(
                    displayText: list, icon: Icons.upload_rounded),
              ),
              Expanded(
                child: LandingButton(
                  displayText: adopt,
                  page: SelectLocation(),
                  icon: Icons.pets,
                ),
              ),
              Expanded(
                child: LandingButton(
                  displayText: dailyFeed,
                  page: DailyFeed(),
                  icon: Icons.list,
                ),
              ),
            ],
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  Widget adminButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.admin_panel_settings),
      backgroundColor: Constants.fadedOrange,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminPage()),
        );
      },
    );
  }
}
