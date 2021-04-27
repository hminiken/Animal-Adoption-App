import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/models/animals.dart';
import 'package:animal_adoption_app/widgets/new_profile_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class NewProfile extends StatefulWidget {
  static const routeName = '/new_profile_screen';
  // static const routeName = '/';
  @override
  NewProfileState createState() => NewProfileState();
}

class NewProfileState extends State<NewProfile> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  var petCategories = ["Dog", "Cat", "Other"];
  var currentVal = null;

  bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

  void isGoodAnimalsChanged(bool value) =>
      setState(() => isGoodAnimals = value);

  void isGoodChildrenChanged(bool value) =>
      setState(() => isGoodChildren = value);

  void isMustLeashChanged(bool value) => setState(() => isMustLeash = value);

  File image;
  final picker = ImagePicker();

  void selectImage() async {
    try {
      var _permissionGranted = await Permission.storage.request();
      if (_permissionGranted.isUndetermined) {
        _permissionGranted = await Permission.storage.request();
        if (_permissionGranted.isDenied) {
          print('Location service permission not granted. Returning.');
          return;
        }
      }
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        image = File(pickedFile.path);
      });
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
    }
  }

  Animals newAnimal;
  // String collection = 'animals';

  uploadNewPetProfile() async {
    FirebaseStorage storage = FirebaseStorage.instance;

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

    FirebaseFirestore.instance.collection(collection).add({
      'about': newAnimal.about,
      'age': newAnimal.age,
      'disposition1': newAnimal.disposition1,
      'disposition2': newAnimal.disposition2,
      'disposition3': newAnimal.disposition3,
      'email': newAnimal.email,
      'phone': newAnimal.phone,
      'url': newAnimal.url,
      'sex': newAnimal.sex,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List a Pet'),
        centerTitle: true,
      ),

      // === Pet Information ===
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Pet Information: ',
                    style: Theme.of(context).textTheme.headline5)),
            SizedBox(height: 15),

            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      // labelStyle: textStyle,
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 14.0),
                      labelText: 'Pet Category',
                      hintText: 'Please select expense',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: currentVal == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: currentVal,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          currentVal = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: petCategories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  newAnimal.name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Pet Name',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  // newAnimal.name = value;
                  // missing field for breed
                },
                decoration: InputDecoration(
                  labelText: 'Breed',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  newAnimal.age = int.parse(value);
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 2,
                onSaved: (value) {
                  newAnimal.about = value;
                },
                decoration: InputDecoration(
                    labelText: 'Pet Bio', border: OutlineInputBorder())),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Pet Disposition: ',
                    style: Theme.of(context).textTheme.headline6)),
            CheckboxListTile(
                value: isGoodAnimals,
                onChanged: isGoodAnimalsChanged,
                title: new Text("Good with other animals"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),
            CheckboxListTile(
                value: isGoodChildren,
                onChanged: isGoodChildrenChanged,
                title: new Text("Good with children"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),
            CheckboxListTile(
                value: isMustLeash,
                onChanged: isMustLeashChanged,
                title: new Text("Animal must be leashed at all times"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),

            // ==== USER INFORMATIon =====
            SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Your Information: ',
                    style: Theme.of(context).textTheme.headline5)),

            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  // newAnimal.n = value;
                  // //Missing owner name for contact
                },
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  newAnimal.phone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone #',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) {
                  newAnimal.email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                )),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: Semantics(
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      uploadNewPetProfile();
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: colDarkBlue, // background
                      onPrimary: Colors.white, // foreground
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                button: true,
                enabled: true,
                onTapHint: 'View Animals',
              ),
            ),
            SizedBox(height: 70),
          ],
        )),
      ),

// == Floating Action Button ==
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Semantics(
        child: new FloatingActionButton(
            onPressed: () {
              selectImage();
            },
            tooltip: 'Upload a new picture',
            backgroundColor: colRed,
            child: new Icon(
              Icons.camera_alt_rounded,
            )),
      ),
    );
  }
}
