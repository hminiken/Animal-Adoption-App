import 'package:cuddler/models/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:cuddler/classes/theme.dart';
import 'package:cuddler/models/animals.dart';
import 'package:cuddler/widgets/global_widgets.dart';
import 'package:cuddler/widgets/new_profile_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class NewProfile extends StatefulWidget {
  static const routeName = '/new_profile_screen';
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
  var sexDropDown = ["Male", "Female"];
  String currentVal = 'Dog';
  var breedCurValue = '';
  var sexCurValue = 'Male';

  List<String> getBreedList(currentVal) {
    var dropdownList;
    if (currentVal == 'Dog') {
      dropdownList = Constants().dogBreeds;
      // breedCurValue = '';
    } else if (currentVal == 'Cat') {
      dropdownList = Constants().catBreeds;
      // breedCurValue = '';
    } else if (currentVal == 'Other') {
      dropdownList = Constants().otherBreeds;
      // breedCurValue = '';
    } else {
      dropdownList = [''];
    }

    return dropdownList;
  }

  File image = new File('assets/images/profileImgPlaceholder.png');
  File defaultImage = new File('assets/images/profileImgPlaceholder.png');
  final picker = ImagePicker();
  Animals newAnimal = new Animals(
      about: '',
      age: 0,
      contactName: '',
      disposition1: false,
      disposition2: false,
      disposition3: false,
      breed: '',
      email: '',
      favorite: false,
      name: '',
      phone: '',
      sex: '',
      url: '',
      location: '');

  bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

  void isGoodAnimalsChanged(bool value) =>
      setState(() => isGoodAnimals = value);

  void isGoodChildrenChanged(bool value) =>
      setState(() => isGoodChildren = value);

  void isMustLeashChanged(bool value) => setState(() => isMustLeash = value);

  void selectImage() async {
    try {
      var _permissionGranted = await Permission.storage.request();
      if (_permissionGranted.isDenied) {
        _permissionGranted = await Permission.storage.request();
        if (_permissionGranted.isPermanentlyDenied) {
          print('Location service permission not granted. Returning.');
          return;
        }
      }
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        image = File(pickedFile!.path);
      });
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
    }
  }

  uploadNewPetProfile() async {
    print("Uploading our content");

    var collection = getCollection(currentVal);

    newAnimal.breed = breedCurValue;
    newAnimal.sex = sexCurValue;

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);

    final TaskSnapshot downloadUrl = (await uploadTask);

    final String url = await downloadUrl.ref.getDownloadURL();

    // FirebaseStorage storage = FirebaseStorage.instance;
    // Reference ref = storage.ref().child("image1" + DateTime.now().toString());
    // UploadTask uploadTask = ref.putFile(image);

    // final String url = 'myimg'; //await ref.getDownloadURL();

    newAnimal.favorite = false;

    FirebaseFirestore.instance.collection(collection).add({
      'about': newAnimal.about,
      'age': newAnimal.age,
      'name': newAnimal.name,
      'breed': newAnimal.breed,
      'disposition1': isGoodAnimals,
      'disposition2': isGoodChildren,
      'disposition3': isMustLeash,
      'email': newAnimal.email,
      'contactName': newAnimal.contactName,
      'phone': newAnimal.phone,
      'url': url,
      'sex': newAnimal.sex,
      'favorite': newAnimal.favorite
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
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: centerText(
                              context, 'Pet Information', Colors.white, 24)),
                      color: colYellow,
                      padding: EdgeInsets.all(10),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          SizedBox(height: 10),
                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    // labelStyle: textStyle,
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 14.0),
                                    labelText: 'Pet Category',
                                    hintText: 'Please select Category',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                isEmpty: currentVal == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: currentVal,
                                    isDense: true,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        currentVal = newValue!;
                                        breedCurValue = '';
                                        getBreedList(currentVal);
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
                          SizedBox(height: 25),
                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    // labelStyle: textStyle,
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 14.0),
                                    labelText: 'Pet Breed',
                                    hintText: 'Please select breed',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                isEmpty: breedCurValue == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: breedCurValue,
                                    isDense: true,
                                    onChanged: (String? breedNewValue) {
                                      setState(() {
                                        breedCurValue = breedNewValue!;
                                        state.didChange(breedNewValue);
                                      });
                                    },
                                    items: getBreedList(currentVal)
                                        .map((String value) {
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
                          SizedBox(height: 25),
                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    // labelStyle: textStyle,
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 14.0),
                                    labelText: 'Sex',
                                    hintText: 'Please select breed',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                isEmpty: sexCurValue == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: sexCurValue,
                                    isDense: true,
                                    onChanged: (String? sexNewValue) {
                                      setState(() {
                                        sexCurValue = sexNewValue!;
                                        state.didChange(sexNewValue);
                                      });
                                    },
                                    items: sexDropDown.map((String value) {
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
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                newAnimal.name = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Pet Name';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Pet Name',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                newAnimal.age = int.parse(value!);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter pet age';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Age',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 2,
                              onSaved: (value) {
                                newAnimal.about = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some info about your pet';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Pet Bio',
                                  border: OutlineInputBorder())),
                          SizedBox(height: 25),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Pet Disposition: ',
                                  style:
                                      Theme.of(context).textTheme.headline6)),
                          CheckboxListTile(
                              value: isGoodAnimals,
                              onChanged: (bool? value) {
                                setState(() => isGoodAnimals = value!);
                              },
                              title: new Text("Good with other animals"),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: colRed),
                          CheckboxListTile(
                              value: isGoodChildren,
                              onChanged: (bool? value) {
                                setState(() => isGoodChildren = value!);
                              },
                              title: new Text("Good with children"),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: colRed),
                          CheckboxListTile(
                              value: isMustLeash,
                              onChanged: (bool? value) {
                                setState(() => isMustLeash = value!);
                              },
                              title: new Text(
                                  "Animal must be leashed at all times"),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: colRed),
                        ])),
                    // ==== USER INFORMATIon =====
                    SizedBox(height: 15),
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: centerText(
                              context, 'Your Information', Colors.white, 24)),
                      color: colYellow,
                      padding: EdgeInsets.all(10),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                newAnimal.contactName = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Your Name',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                newAnimal.phone = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Phone #',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                newAnimal.email = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 30),
                          ElevatedButton.icon(
                            label: const Text(
                              'Upload Image',
                              style: TextStyle(fontSize: 20),
                            ),
                            icon: const Icon(Icons.photo),
                            // backgroundColor: colDarkBlue,
                            onPressed: () {
                              selectImage();
                            },

                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        colRed), // background
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: ClipRRect(
                              // borderRadius: BorderRadius.circular(80.0),

                              child: setUploadImage(context, image),
                            ),
                          ),
                          SizedBox(height: 15),
                        ])),

                    SizedBox(height: 30),

                    SizedBox(height: 70),
                  ],
                ))),

// == Floating Action Button ==
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Semantics(
          child: new FloatingActionButton.extended(
            onPressed: () {
              if (image.path == defaultImage.path) {
                showAlertDialog(context, 'Missing Photo',
                    'Please upload an image of your pet to proceed');
              } else if (currentVal == '') {
                showAlertDialog(context, 'Missing Category',
                    'Please choose your pet\'s category');
              } else if (breedCurValue == '') {
                showAlertDialog(context, 'Missing Breed',
                    'Please choose your pet\'s breed');
              } else if (sexCurValue == '') {
                showAlertDialog(context, 'Missing Sex',
                    'Please choose the sex of your pet');
              }
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                uploadNewPetProfile();
                Navigator.of(context).pop();
              }
            },
            tooltip: 'Upload your Pet',
            backgroundColor: colDarkBlue,
            label: const Text('Upload your Pet'),
            icon: const Icon(
              Icons.upload_rounded,
            ),
          ),
        ));
  }
}
