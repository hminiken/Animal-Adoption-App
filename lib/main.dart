import 'package:flutter/material.dart';
import 'screens/lists.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Routes
  static final routes = {
    '/': (context) => Lists(),
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuddler',
      routes: routes,
    );
  }
}
