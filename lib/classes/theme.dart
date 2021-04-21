import 'package:flutter/material.dart';


  Color colDarkBlue = Color(0xFF264653);
  Color colTeal = Color(0xFF2A9D8F);
  Color colYellow = Color(0xFFE9C46A);
  Color colOrange = Color(0xFFF4A261);
  Color colRed = Color(0xFFE76F51);

final ThemeData CuddlerThemeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: CuddlerPalette.cuddlerPalette,
  primaryColor: CuddlerPalette.cuddlerPalette[100],
  primaryColorBrightness: Brightness.light,
  accentColor: CuddlerPalette.cuddlerPalette[200],
  accentColorBrightness: Brightness.light
);
  

class CuddlerPalette {
      static const MaterialColor cuddlerPalette = MaterialColor(_palettePrimaryValue, <int, Color>{
      50: Color(0xFF264653),
      100: Color(0xFF2A9D8F),
      200: Color(0xFFE9C46A),
      300: Color(0xFFF4A261),
      400: Color(0xFFE76F51),
    });
    static const int _palettePrimaryValue = 0xFF2A9D8F;

    static const MaterialColor paletteAccent = MaterialColor(_paletteAccentValue, <int, Color>{
      100: Color(0xFFADFFF3),
      200: Color(_paletteAccentValue),
      400: Color(0xFF47FFE4),
      700: Color(0xFF2DFFE0),
    });
    static const int _paletteAccentValue = 0xFF7AFFEC;
}