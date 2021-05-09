import 'package:flutter/material.dart';

import 'package:cuddler/classes/theme.dart';
import 'package:cuddler/models/animals.dart';
import 'package:cuddler/widgets/global_widgets.dart';
import 'package:cuddler/widgets/new_profile_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class userInfo extends StatefulWidget {
  static const routeName = '/update-user-info';
  @override
  userInfoState createState() => userInfoState();
}

class userInfoState extends State<userInfo> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Information'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(height: 10),
              Form(key: formKey, child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: []))
            ])));
  }
}
