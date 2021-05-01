import 'package:flutter/material.dart';
import 'models/constants.dart';
import 'pages/dashboard.dart';
import 'pages/login.dart';
import 'widgets/transition_route_observer.dart';
import 'pages/lists.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuddler',
      theme: ThemeData(
        // brightness: Brightness.dark,
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
            fontFamily: 'Hanuman',
          ),
          caption: TextStyle(
            fontFamily: 'JosefinSlab',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Constants.deepBlue,
          ),
          headline1: TextStyle(fontFamily: 'Courgette'),
          headline2: TextStyle(fontFamily: 'Hanuman'),
          headline4: TextStyle(fontFamily: 'Solway'),
          headline5: TextStyle(fontFamily: 'Solway'),
          headline6: TextStyle(fontFamily: 'Solway'),
          subtitle1: TextStyle(fontFamily: 'Solway'),
          bodyText1: TextStyle(fontFamily: 'Solway'),
          bodyText2: TextStyle(fontFamily: 'Solway'),
          subtitle2: TextStyle(fontFamily: 'JosefinSlab'),
          overline: TextStyle(fontFamily: 'JosefinSlab'),
        ),
      ),
      home: Login(),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: Login.routeName,
      routes: {
        Login.routeName: (context) => Login(),
        Dashboard.routeName: (context) => Dashboard(),
        '/Lists': (context) => Lists(),
      },
    );
  }
}
