import 'dart:io';

import 'package:cuddler/models/constants.dart';
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

Widget setUploadImage(BuildContext context, File image) {
  if (image == File("assets/images/profileImgPlaceholder.png")) {
    return Image.asset(
      "assets/images/profileImgPlaceholder.png",

      // height: 125.0,
      height: MediaQuery.of(context).size.width / 3,
      fit: BoxFit.cover,
    );
  } else {
    return Image.file(
      image,
      // height: 125.0,
      height: MediaQuery.of(context).size.width / 3,
      fit: BoxFit.cover,
    );
  }
}

showAlertDialog(BuildContext context, title, message) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

List<String> getBreedList(currentVal) {
  var dropdownList;
  if (currentVal == 'Dog') {
    dropdownList = Constants().dogBreeds;
  } else if (currentVal == 'Cat') {
    dropdownList = Constants().catBreeds;
  } else if (currentVal == 'Other') {
    dropdownList = Constants().otherBreeds;
  } else {
    dropdownList = [''];
  }

  return dropdownList;
}

String getCollection(String currentVal) {
  var collection;

  if (currentVal == 'Dog') {
    collection = 'dogs';
  } else if (currentVal == 'Cat') {
    collection = 'cats';
  } else if (currentVal == 'Other') {
    collection = 'others';
  } else {
    collection = 'animals';
  }

  return collection;
}
