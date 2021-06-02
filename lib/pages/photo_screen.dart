import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../models/constants.dart';
import '../widgets/background.dart';
import 'new_profile_screen.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = '/photo_screen';
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<PhotoScreen> {
  File image = new File('assets/images/profileImgPlaceholder.png');
  final picker = ImagePicker();
  String url =
      'https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/blank_animal.png?alt=media&token=095373ec-af4d-4e12-993f-aed84d5f373d';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Photo Options of the Pet'),
        backgroundColor: Constants.tealBlue,
      ),
      body: Stack(
        children: [
          fadedBackground(context),
          Container(
            child: picOptions(context),
          ),
          //LayoutBuilder(builder: layoutPhotoPic),
        ],
      ),
    );
  }

  Widget layoutLanding(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500 ? picOptions(context) : picOptions(context);

  Widget picOptions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album_outlined),
          title: Text(
            'Choose photo from gallery',
            style: TextStyle(
              fontFamily: 'DellaRespira',
              fontSize: 28.0,
            ),
          ),
          onTap: () {
            _imgDecider(ImageSource.gallery);
          },
        ),
        Divider(
          color: Constants.fadedOrange,
        ),
        ListTile(
          leading: Icon(Icons.photo_camera),
          title: Text(
            'Take photo with camera',
            style: TextStyle(
              fontFamily: 'DellaRespira',
              fontSize: 28.0,
            ),
          ),
          onTap: () {
            _imgDecider(ImageSource.camera);
          },
        ),
        Divider(
          color: Constants.fadedOrange,
        ),
        ListTile(
          leading: Icon(Icons.photo_camera_front),
          title: Text(
            'Update photo later',
            style: TextStyle(
              fontFamily: 'DellaRespira',
              fontSize: 28.0,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewProfile(photoURL: url)),
            );
          },
        ),
      ],
    );
  }

  void _imgDecider(ImageSource src) async {
    try {
      var _permissionGranted = await Permission.storage.request();
      if (_permissionGranted.isDenied) {
        _permissionGranted = await Permission.storage.request();
        if (_permissionGranted.isPermanentlyDenied) {
          print('Location service permission not granted. Returning.');
          return;
        }
      }
      final pickedFile = await picker.getImage(source: src);
      image = File(pickedFile!.path);
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child(image.path + DateTime.now().toString());
      UploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.whenComplete(() async {
        url = await storageReference.getDownloadURL();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewProfile(photoURL: url)),
        );
      });
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
    }
  }
}
