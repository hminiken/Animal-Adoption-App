import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

Widget buildNewProfileTextField(BuildContext context, String label) {
  return TextFormField(
      onSaved: (value) {},
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ));
}

final picker = ImagePicker();

Widget setUploadImage(BuildContext context, File image, String url) {
  if (image.path != "") {
    return Image.network(
      url,
      // height: 125.0,
      height: 125,
      width: 125,
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
