import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddler/pages/add_news_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/background.dart';

class DailyFeed extends StatefulWidget {
  static const routeName = '/daily-feed';
  @override
  DailyFeedState createState() => DailyFeedState();
}

class DailyFeedState extends State<DailyFeed> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
    // getNewsUpdates();
  }

  final curUser = FirebaseAuth.instance.currentUser!;
  CuddlerUser currentUser = new CuddlerUser(
      userID: "",
      fName: "",
      email: "",
      phoneNumber: "",
      accountType: 1,
      userLocation: "",
      profileImgURL: "");

  getUserInfo() async {
    currentUser = await currentUser.getUserData(curUser);

    setState(() {});
  }

  void pushViewEntry(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AddNewsItem.routeName)
        .then((value) => setState(() {
              getNewsUpdates();
            }));
  }

  List<String> newsFeed = [];

  getNewsUpdates() async {
    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      newsFeed = List.from(documentSnapshot["newsFeed"]);

      for (int i = 0; i < newsFeed.length; i++) {
        var result = FirebaseFirestore.instance
            .collection('news')
            .doc(newsFeed[i])
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          entries.add(documentSnapshot['headline']);
          content.add(documentSnapshot['content']);
        });
        print(result);
      }

      setState(() {});
    });
    print(result);
  }

  void deleteItem(DocumentSnapshot post) {
    final curUser = FirebaseAuth.instance.currentUser!;

    var userNews = FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .collection('newsFeed')
        .doc(post.id)
        .delete()
        .catchError((error) => print("Failed to delete: $error"));

    print(userNews);
  }

  late String userEmail;
  List newOthers = [];
  List newDogs = [];
  List newCats = [];

  List<String> entries = [];
  List<String> content = [];

  DailyFeedState() {
    userEmail = currentUser.email;

    FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: userEmail)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["email"]);
        print(doc["userLocation"]);
      });
    });
  }

  // db.collection('books').where('genre', '==', 'biography').get();

  final List<int> colorCodes = <int>[600, 500, 100];

  bool isAdmin = false;

  Widget build(BuildContext context) {
    if (currentUser.accountType == 0) {
      isAdmin = true;
    }
    CollectionReference userData = FirebaseFirestore.instance
        .collection('users')
        .doc(curUser.uid)
        .collection('newsFeed');

    return Scaffold(
        appBar: AppBar(
          title: Text('Daily Feed'),
          centerTitle: true,
          actions: isAdmin
              ? [
                  IconButton(
                    onPressed: () {
                      // uploadPets();
                      pushViewEntry(context);
                    },
                    icon: Icon(Icons.add),
                  ),
                ]
              : [],
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          //image code
          fadedBackground(context),

          // final Query userData = others.where("email", isEqualTo: curUser.email);
          StreamBuilder<QuerySnapshot>(
            stream: userData.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //If firebase has data display it as a list
              if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data!.docs[index];
                      var headline = post['headline'].toString();
                      var content = post['content'];
                      return Dismissible(
                          key: ObjectKey(post),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // border: Border(bottom: BorderSide(color: (Colors.grey[300])!))),
                                    // border: Border.all(
                                    //   color: Colors.grey[200]!,
                                    // ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 7,
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: Offset(0, 4),
                                        spreadRadius: 3,
                                      )
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      headline + "\n",
                                      // style: textTheme.subtitle1,
                                    ),
                                    subtitle: Text(
                                      content,
                                    ),
                                    contentPadding: EdgeInsets.all(20),

                                    trailing: Text("May 14"),
                                    // onTap: () => pushViewEntry(context, optionRoute[index]),
                                  ))),
                          onDismissed: (direction) {
                            deleteItem(post);
                          });
                    });
              }
              //If firebase has no data use circular loading picture
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ]));
  }
}
