import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/constants.dart';
import '../models/user_model.dart';
import '../widgets/new_profile_widgets.dart';

class UpdateUserInfo extends StatefulWidget {
  static const routeName = '/update-user-info';
  @override
  UpdateUserInfoState createState() => UpdateUserInfoState();
}

class UpdateUserInfoState extends State<UpdateUserInfo> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  CuddlerUser currentUser = new CuddlerUser(
      userID: "",
      fName: "",
      email: "",
      phoneNumber: "",
      accountType: 1,
      userLocation: "",
      profileImgURL: "");

  var curUser;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  File image = new File('assets/images/profileImgPlaceholder.png');

  void selectImage() async {
    try {
      var _permissionGranted = await Permission.storage.request();
      if (_permissionGranted.isDenied) {
        _permissionGranted = await Permission.storage.request();
        if (_permissionGranted.isPermanentlyDenied) {
          print('Permission not granted. Returning.');
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

    setState(() {
      updateProfileImage = true;
    });
  }

  final user = FirebaseAuth.instance.currentUser!;

  getUserInfo() async {
    currentUser = await currentUser.getUserData(user);

    setState(() {
      currentVal = currentUser.userLocation;
    });
  }

  String currentVal = "Alabama";
  bool updateProfileImage = false;

  updateUser() async {
    final curUser = FirebaseAuth.instance.currentUser!;

    String url = currentUser.profileImgURL;

    if (updateProfileImage == true) {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("image" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(image);

      final TaskSnapshot downloadUrl = (await uploadTask);

      url = await downloadUrl.ref.getDownloadURL();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .update({
          'fName': currentUser.fName,
          'phoneNumber': currentUser.phoneNumber,
          'userLocation': currentVal,
          'profileImgURL': url,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    TextEditingController displayNameController = new TextEditingController();
    displayNameController.text = currentUser.fName;

    TextEditingController phoneController = new TextEditingController();
    phoneController.text = currentUser.phoneNumber;

    return Scaffold(
        appBar: AppBar(
          title: Text('Update Information'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(height: 10),
                Form(
                    key: formKey,
                    child: Column(children: [
                      Text(
                        "My Information: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 25),
                      ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Display Name: "),
                          subtitle: TextFormField(
                            controller: displayNameController,
                            onSaved: (value) {
                              currentUser.fName = value!;
                              setState(() {});
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a display name';
                              } else {
                                return null;
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                          leading: Icon(Icons.phone_android),
                          title: Text("Phone #: "),
                          subtitle: TextFormField(
                            controller: phoneController,
                            onSaved: (value) {
                              currentUser.phoneNumber = value!;
                              setState(() {});
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              } else {
                                return null;
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Location: "),
                          subtitle: DropdownButtonFormField(
                            items:
                                Constants().statesList.map((String category) {
                              return new DropdownMenuItem(
                                  value: category,
                                  child: Row(
                                    children: <Widget>[
                                      // Icon(Icons.star),
                                      Text(category),
                                    ],
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                currentVal = newValue!;
                              });
                            },
                            value: currentVal,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 20),
                              // filled: true,
                              // fillColor: Colors.grey[200],
                              //  hintText: Localization.of(context).category,
                              //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Profile Picture"),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Constants.fadedYellow,
                            width: 5,
                          ),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80.0),
                            child: Image.file(
                              image,
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            )),
                      ),
                      ElevatedButton.icon(
                        label: const Text(
                          'Upload Image',
                          style: TextStyle(fontSize: 20),
                        ),
                        icon: const Icon(Icons.photo),
                        // backgroundColor: colDarkBlue,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          }
                          selectImage();
                        },

                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constants.redOrange), // background
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                        label: const Text(
                          'Update',
                          style: TextStyle(fontSize: 20),
                        ),
                        icon: const Icon(Icons.update_sharp),
                        // backgroundColor: colDarkBlue,
                        onPressed: () {
                          // selectImage();
                          isLoading = true;
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            updateUser();
                          }
                        },

                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constants.deepBlue), // background
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                      ),
                    ]))
              ])),
          isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Center(
                        child: CircularProgressIndicator(),
                      )),
                )
              : Container()
        ])));
  }
}
