import 'package:cloud_firestore/cloud_firestore.dart';

class CuddlerUser {
  int userID;
  String profileImgURL, 
         fName,
         email,
         password,
         accountType; //e.g. admin, shelter, regular
  Timestamp entryDate;
  DocumentReference reference;

  CuddlerUser(
      {this.userID,
      this.entryDate,
      this.profileImgURL});

  CuddlerUser.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['num_items'] != null),
        assert(map['image_url'] != null),
        assert(map['entry_date'] != null),
        userID = map['num_items'],
        profileImgURL = map['image_url'],
        entryDate = map['entry_date'];

  factory CuddlerUser.fromSnapshot(DocumentSnapshot snapshot) {
    return CuddlerUser(
      userID: snapshot['num_items'],
      profileImgURL: snapshot['image_url'],
      entryDate: snapshot['entry_date'],
    );
  }
}
