import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/screens/new_profile_screen.dart';
import 'package:animal_adoption_app/screens/select_location_screen.dart';
import 'package:animal_adoption_app/screens/update_status_screen.dart';
import 'package:animal_adoption_app/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry/sentry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class Cuddler extends StatefulWidget {
  static Future<void> reportError(dynamic error, dynamic stackTrace) async {
    final sentryId =
        await Sentry.captureException(error, stackTrace: stackTrace);
  }

  static final routes = {
    NewProfile.routeName: (context) => NewProfile(),
    SelectLocation.routeName: (context) => SelectLocation(),
    UpdateStatus.routeName: (context) => UpdateStatus(),
    UserProfile.routeName: (context) => UserProfile(),
    // HomeScreen.routeName: (context) => HomeScreen()
  };

  @override
  CuddlerState createState() => CuddlerState();
}

class CuddlerState extends State<Cuddler> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Cuddler',
      //  color: CuddlerPalette.cuddlerPalette[300],
      //   theme: CuddlerThemeData,
      theme: ThemeData(
        primaryColor: colTeal,
      ),
      routes: Cuddler.routes,
      navigatorObservers: <NavigatorObserver>[observer],
      debugShowCheckedModeBanner: false,
    );
  }
}
