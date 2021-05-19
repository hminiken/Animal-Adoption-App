import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/constants.dart';

QuerySnapshot? getUserProfile(String userEmail) {
  // FirebaseFirestore.instance
  //     .collection('users')
  //     .where("email", isEqualTo: userEmail)
  //     .limit(1)
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc["email"]);
  //     print(doc["userLocation"]);
  //     print(doc["likedDogs"]);
  //   });
  // });

  FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: userEmail)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot;
  });

  return null;
}

class DailyFeed extends StatefulWidget {
  static const routeName = '/daily-feed';
  @override
  DailyFeedState createState() => DailyFeedState();
}

class DailyFeedState extends State<DailyFeed> {
  @override
  void initState() {
    super.initState();
    getNewsUpdates();
  }

  getNewsUpdates() async {
    entries.add("X Pets now available!");
    entries.add("X Pets now liked!");
    content.add("X Pets now liked!");
    content.add("X Pets now liked!");

    var result = await FirebaseFirestore.instance
        .collection('news')
        .where("dateAdded", isGreaterThanOrEqualTo: 1620686591)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["headline"]);
        entries.add(doc["headline"]);
        content.add(doc["content"]);
      });
    });

    final curUser = FirebaseAuth.instance.currentUser!;

    var userNews = await FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .update({
          'newsFeed': entries,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));

    setState(() {});
  }

  void deleteItem(index) {
    /*
  By implementing this method, it ensures that upon being dismissed from our widget tree, 
  the item is removed from our list of items and our list is updated, hence
  preventing the "Dismissed widget still in widget tree error" when we reload.
  */

    setState(() {
      entries.removeAt(index);
    });

    final curUser = FirebaseAuth.instance.currentUser!;

    var userNews = FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .update({
          'newsFeed': entries,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  var user;
  late String userEmail;
  List newOthers = [];
  List newDogs = [];
  List newCats = [];

  List<String> entries = [];
  List<String> content = [];

  DailyFeedState() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    var now = ms / 1000;

    var oneDayAgo = now - 86400;
    var oneWeekAgo = now - (86400 * 7);
    print(now);
    print(oneDayAgo);

    user = FirebaseAuth.instance.currentUser!;
    userEmail = user.email;

    FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: userEmail)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["email"]);
        print(doc["userLocation"]);
        print(doc["likedDogs"]);
      });
    });
  }

  // db.collection('books').where('genre', '==', 'biography').get();

  final List<int> colorCodes = <int>[600, 500, 100];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Feed'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          //image code
          Image.asset(
            'assets/images/faded-background.png',
            fit: BoxFit.cover,
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / ,
          ),
          //top grey shadow
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  end: const Alignment(0.0, 0.4),
                  begin: const Alignment(0.0, -1),
                  colors: <Color>[
                    const Color(0x8A000000),
                    Colors.white.withOpacity(0.0)
                  ],
                ),
              ),
            ),
          ),
          //bottom grey shadow
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  end: const Alignment(0.0, -1.7),
                  begin: const Alignment(0.0, 0.5),
                  colors: <Color>[
                    Colors.white.withOpacity(0.99),
                    Colors.white.withOpacity(0.0)
                  ],
                ),
              ),
            ),
          ),

          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          return buildListItem(context, index);
                        })),
              ]))
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    var textTheme = Theme.of(context).textTheme;

    return Dismissible(
        key: ObjectKey(entries[index]),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  // border: Border(bottom: BorderSide(color: (Colors.grey[300])!))),
                  // border: Border.all(
                  //   color: Colors.grey[200]!,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 4),
                      spreadRadius: 7,
                    )
                  ],
                ),
                child: ListTile(
                  title: Text(
                    entries[index] + "\n",
                    style: textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    content[index] + "\n",
                  ),
                  contentPadding: EdgeInsets.all(20),

                  trailing: Text("May 14"),
                  // onTap: () => pushViewEntry(context, optionRoute[index]),
                ))),
        onDismissed: (direction) {
          var item = entries.elementAt(index);
          deleteItem(index);
        });
  }
}
