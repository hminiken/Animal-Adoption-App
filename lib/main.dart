import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.landscapeLeft, 
    DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(App());
}
