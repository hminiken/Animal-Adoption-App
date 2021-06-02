import 'package:cuddler/pages/add_news_item.dart';
import 'package:cuddler/pages/photo_screen.dart';
import 'package:flutter/material.dart';
import 'models/constants.dart';
import 'pages/dashboard.dart';
import 'pages/login.dart';
import 'pages/about_cuddler_screen.dart';
import 'pages/daily_feed.dart';
import 'package:cuddler/pages/email_preferences.dart';

import 'pages/admin_screen.dart';
import 'pages/new_profile_screen.dart';
import 'pages/photo_screen.dart';
import 'pages/select_location_screen.dart';
import 'pages/user_info_screen.dart';
import 'pages/user_listed_pets.dart';
import 'pages/update_status_screen.dart';
import 'pages/user_profile_screen.dart';
import 'pages/add_news_item.dart';
import 'widgets/transition_route_observer.dart';
import 'pages/lists.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuddler',
      theme: ThemeData(
        primaryColor: Constants.tealBlue,
        accentColor: Constants.tealBlue,
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Constants.fadedOrange),
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'DellaRespira',
            fontSize: 50.0,
            color: Constants.deepBlue,
          ),
          button: TextStyle(
            fontFamily: 'Solway',
          ),
          caption: TextStyle(
            fontFamily: 'Courgette',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Constants.deepBlue,
          ),
          headline1: TextStyle(fontFamily: 'Courgette'),
          headline2: TextStyle(fontFamily: 'Hanuman'),
          headline4: TextStyle(fontFamily: 'Solway'),
          headline5: TextStyle(fontFamily: 'Courgette'),
          headline6: TextStyle(fontFamily: 'Courgette'),
          subtitle1: TextStyle(fontFamily: 'Solway'),
          bodyText1: TextStyle(fontFamily: 'Courgette'),
          bodyText2: TextStyle(fontFamily: 'Solway'),
          subtitle2: TextStyle(fontFamily: 'Solway'),
          overline: TextStyle(fontFamily: 'Courgette'),
        ),
      ),
      home: Login(),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: Login.routeName,
      // initialRoute: Dashboard.routeName,
      routes: {
        Login.routeName: (context) => Login(),
        Dashboard.routeName: (context) => Dashboard(),
        AdminPage.routeName: (context) => AdminPage(),
        PhotoScreen.routeName: (context) => PhotoScreen(),
        NewProfile.routeName: (context) => NewProfile(
            photoURL:
                'https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/blank_animal.png?alt=media&token=095373ec-af4d-4e12-993f-aed84d5f373d'),
        SelectLocation.routeName: (context) => SelectLocation(),
        UpdateStatus.routeName: (context) => UpdateStatus(),
        UserProfile.routeName: (context) => UserProfile(),
        AboutCuddler.routeName: (context) => AboutCuddler(),
        UserListed.routeName: (context) => UserListed(),
        Lists.routeName: (context) => Lists(),
        UpdateUserInfo.routeName: (context) => UpdateUserInfo(),
        EmailPreferences.routeName: (context) => EmailPreferences(),
        DailyFeed.routeName: (context) => DailyFeed(),
        AddNewsItem.routeName: (context) => AddNewsItem(),
      },
    );
  }
}
