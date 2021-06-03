import 'package:cuddler/models/news_item.dart';
import 'package:flutter/material.dart';
import '../models/constants.dart';

class AddNewsItem extends StatefulWidget {
  static const routeName = '/add-news-item';
  @override
  AddNewsItemState createState() => AddNewsItemState();
}

class AddNewsItemState extends State<AddNewsItem> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  String headline = "", content = "";
<<<<<<< Updated upstream
=======
  String newsItemID = "";

  postNewsItem() async {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    var now = ms ~/ 1000;

    FirebaseFirestore.instance.collection('news').add({
      'headline': headline,
      'content': content,
      'dateAdded': now,
    }).then((value) {
      print(value.id);
      newsItemID = value.id;
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((documentSnapshot) {
          documentSnapshot.reference.collection('newsFeed').add(
              {'headline': headline, 'content': content, 'dateAdded': now});
          // documentSnapshot.reference.update({
          //   'newsFeed': FieldValue.arrayUnion([newsItemID])
          // });
        });
      });
    });

    // var result = await FirebaseFirestore.instance
    //     .collection('news')
    //     .where("dateAdded", isGreaterThanOrEqualTo: 1620686591)
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["headline"]);
    //     entries.add(doc["headline"]);
    //     content.add(doc["content"]);
    //   });
    // });
  }
>>>>>>> Stashed changes

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post Update'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: Align(
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Post an Update   ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                WidgetSpan(
                                    child: Tooltip(
                                  message:
                                      'Admins may add to the daily feed by posting an update here. \n\nNote: The update will go to ALL app users!',
                                  child: Icon(
                                    Icons.help_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(20),
                                ))
                              ]),
                            )),
                      ),

                      // child: Align(
                      //     alignment: Alignment.centerLeft,
                      //     child:),
                      color: Constants.fadedYellow,
                      padding: EdgeInsets.all(10),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          SizedBox(height: 25),
                          TextFormField(
                              onSaved: (value) {
                                headline = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Title',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 4,
                              onSaved: (value) {
                                content = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a description';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(),
                              )),
                          SizedBox(height: 30),
                          ElevatedButton.icon(
                            label: const Text(
                              'Upload',
                              style: TextStyle(fontSize: 20),
                            ),
                            icon: const Icon(Icons.upload_rounded),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                NewsItem().postNewsItem(headline, content);
                                Navigator.of(context).pop();
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constants.deepBlue), // background
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
                          SizedBox(height: 15),
                        ])),
                    SizedBox(height: 30),
                    SizedBox(height: 70),
                  ],
                ))));
  }
}
