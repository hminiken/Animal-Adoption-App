import 'classes/theme.dart';
import 'screens/about_cuddler_screen.dart';
import 'screens/new_profile_screen.dart';
import 'screens/select_location_screen.dart';
import 'screens/update_status_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/temp_home.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';

class App extends StatefulWidget {
  static Future<void> reportError(dynamic error, dynamic stackTrace) async {}

  static final routes = {
    NewProfile.routeName: (context) => NewProfile(),
    SelectLocation.routeName: (context) => SelectLocation(),
    UpdateStatus.routeName: (context) => UpdateStatus(),
    UserProfile.routeName: (context) => UserProfile(),
    AboutCuddler.routeName: (context) => AboutCuddler(),
    tempHome.routeName: (context) => tempHome()
  };

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Cuddler',
      //  color: CuddlerPalette.cuddlerPalette[300],
      //   theme: CuddlerThemeData,
      theme: ThemeData(
        primaryColor: colTeal,
      ),
      routes: App.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
