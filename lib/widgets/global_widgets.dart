import 'package:flutter/cupertino.dart';

Widget centerText(
    BuildContext context, String content, Color textColor, double textSize) {
  return Align(
      alignment: Alignment.center,
      child: Text(content,
          style: TextStyle(color: textColor, fontSize: textSize)));
}
