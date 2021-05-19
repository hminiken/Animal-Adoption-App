import 'package:cloud_firestore/cloud_firestore.dart';

class CuddlerUser {
  String userID, profileImgURL, fName, phoneNumber, email, userLocation;
  int accountType; //e.g. admin = 0, shelter = 1, regular =2
  // List likedDogs = new List();
  // Timestamp entryDate;

  CuddlerUser(
      {required this.userID,
      required this.fName,
      required this.email,
      required this.phoneNumber,
      required this.accountType,
      required this.userLocation,
      required this.profileImgURL});
}

// CuddlerUser.fromMap(Map<String, dynamic> map, {this.reference})
//     : assert(map['userID'] != null),
//       assert(map['email'] != null),
//       assert(map['password'] != null),
//       assert(map['userID'] != null),
//       userID = map['num_items'],
//       profileImgURL = map['profileImgURL'];

// factory CuddlerUser.fromSnapshot(DocumentSnapshot snapshot) {
//   return CuddlerUser(
//     userID: snapshot['userID'],
//     profileImgURL: snapshot['profileImgURL'],
//     fName: snapshot['fName'],
//     email: snapshot['email'],
//     password: snapshot['password'],
//     accountType: snapshot['accountType'],
//   );
// }
