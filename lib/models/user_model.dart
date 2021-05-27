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

  Future<CuddlerUser> getUserData(var user) async {
    CuddlerUser currentUser = new CuddlerUser(
        userID: "",
        fName: "",
        email: "",
        phoneNumber: "",
        accountType: 1,
        userLocation: "",
        profileImgURL: "");

    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        currentUser.userID = user.uid;
        currentUser.profileImgURL = documentSnapshot.get("profileImgURL");
        currentUser.fName = documentSnapshot.get("fName");
        currentUser.email = documentSnapshot.get("email");
        currentUser.phoneNumber = documentSnapshot.get("phoneNumber");
        currentUser.accountType = documentSnapshot.get("accountType");
        currentUser.userLocation = documentSnapshot.get("userLocation");
      } else {
        print('Document does not exist on the database');
      }
    });

    print(result);

    return currentUser;
  }
}
