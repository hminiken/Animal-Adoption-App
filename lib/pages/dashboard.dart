import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cuddler/pages/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'admin_screen.dart';
import '../models/constants.dart';
//import 'new_profile_screen.dart';
//import 'select_location_screen.dart';
import '../widgets/background.dart';
import '../widgets/landingButton.dart';
import '../widgets/transition_route_observer.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isAdmin = false;
  final routeObserver = TransitionRouteObserver<PageRoute>();

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

  void decideAdmin() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((snap) {
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
              //pushViewEntry(context, UserProfile.routeName);
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
          Background(),
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
            width: 80.0,
            child: Image.asset('images/blueHeartLogo.png'),
          ),
          Expanded(
            child: Text(
              'Cuddler',
              style: TextStyle(
                  fontFamily: 'OleoScriptSwashCaps',
                  fontSize: 38.0,
                  color: Constants.deepBlue),
            ),
          ),
          Expanded(
            child: Text(
              'Welcome, ${user.email}',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Please choose an option',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: LandingButton(
              displayText: list,
              page: Placeholder(), //NewProfile(),
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            child: LandingButton(
              displayText: adopt,
              page: Placeholder(), //SelectLocation(),
            ),
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
                width: 80.0,
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
                child: LandingButton(
                  displayText: list,
                  page: Placeholder(), //NewProfile(),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: LandingButton(
                  displayText: adopt,
                  page: Placeholder(), //SelectLocation(),
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
