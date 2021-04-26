import 'package:flutter/material.dart';

bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

Widget buildNewProfileTextField(BuildContext context, String label) {
  return TextFormField(
      onSaved: (value) {},
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ));
}
