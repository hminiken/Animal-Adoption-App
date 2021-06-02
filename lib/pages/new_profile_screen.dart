import 'package:cuddler/models/constants.dart';
import 'package:cuddler/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuddler/models/animals.dart';
import 'package:cuddler/widgets/global_widgets.dart';
import 'package:cuddler/widgets/new_profile_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class NewProfile extends StatefulWidget {
  static const routeName = '/new_profile_screen';
  NewProfile({required this.photoURL});
  final String photoURL;
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

  final user = FirebaseAuth.instance.currentUser!;

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

  uploadNewPetProfile() async {
    print("Uploading our content");

    var collection = getCollection(currentVal);

    newAnimal.breed = breedCurValue;
    newAnimal.sex = sexCurValue;

    final uid = user.uid;

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
      'url': widget.photoURL,
      'sex': newAnimal.sex,
      'favorite': newAnimal.favorite,
      'location': newAnimal.location,
      'dateAdded': DateTime.now(),
      'uid': uid
    });
  }

  @override
  Widget build(BuildContext context) {
    File image = File(widget.photoURL);
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
                      color: Constants.fadedYellow,
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
                                    hintText: 'Please select gender',
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
                              activeColor: Constants.redOrange),
                          CheckboxListTile(
                              value: isGoodChildren,
                              onChanged: (bool? value) {
                                setState(() => isGoodChildren = value!);
                              },
                              title: new Text("Good with children"),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Constants.redOrange),
                          CheckboxListTile(
                              value: isMustLeash,
                              onChanged: (bool? value) {
                                setState(() => isMustLeash = value!);
                              },
                              title: new Text(
                                  "Animal must be leashed at all times"),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Constants.redOrange),
                        ])),
                    // ==== USER INFORMATIon =====
                    SizedBox(height: 15),
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: centerText(
                              context, 'Your Information', Colors.white, 24)),
                      color: Constants.fadedYellow,
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
                          // ElevatedButton.icon(
                          //   label: const Text(
                          //     'Upload Image',
                          //     style: TextStyle(fontSize: 20),
                          //   ),
                          //   icon: const Icon(Icons.photo),
                          //   // backgroundColor: colDarkBlue,
                          //   onPressed: () {
                          //     selectImage();
                          //   },

                          //   style: ButtonStyle(
                          //       backgroundColor:
                          //           MaterialStateProperty.all<Color>(
                          //               Constants.redOrange), // background
                          //       foregroundColor:
                          //           MaterialStateProperty.all<Color>(
                          //               Colors.white),
                          //       shape: MaterialStateProperty.all<
                          //               RoundedRectangleBorder>(
                          //           RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(20),
                          //       ))),
                          // ),
                          SizedBox(height: 15),
                          Container(
                            child: CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage(widget.photoURL),
                              backgroundColor: Colors.transparent,
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
              if (currentVal == '') {
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
                Navigator.of(context).pushNamed(Dashboard.routeName);
              }
            },
            tooltip: 'Upload your Pet',
            backgroundColor: Constants.deepBlue,
            label: const Text('Upload your Pet'),
            icon: const Icon(
              Icons.upload_rounded,
            ),
          ),
        ));
  }
}
