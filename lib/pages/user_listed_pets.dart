import 'update_status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/my_flutter_app_icons.dart';

String uid = 'I1tRDK1UeCV3kyeUbU9jjUj7NoX2';

class StatusArguments {
  // final File image;
  String imageURL, currentStatus, petName;
  DocumentReference id;

  StatusArguments(this.imageURL, this.currentStatus, this.petName, this.id);
  // PostDetailArguments(this.image);
}

void pushNewEntry(BuildContext context, String image, String status,
    String name, DocumentReference id) {
  Navigator.of(context).pushNamed(UpdateStatus.routeName,
      arguments: StatusArguments(image, status, name, id));
}

//List screen Widget
class UserListed extends StatefulWidget {
  static const routeName = '/user_listed_page';

  @override
  _UserListedState createState() => _UserListedState();
}

class _UserListedState extends State<UserListed> {
  //unique user id. Need to add later to "fetch" this from current login session

  String uid = 'I1tRDK1UeCV3kyeUbU9jjUj7NoX2';

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //       primarySwatch: Colors.teal,
    //       fontFamily: GoogleFonts.gabriela().fontFamily),
    //   home:

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(MyFlutterApp.dog)),
              Tab(icon: Icon(MyFlutterApp.cat)),
              Tab(icon: Icon(MyFlutterApp.pastafarianism)),
            ],
          ),
          title: Text('My Listed Pets'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            DogsList(),
            CatsList(),
            OthersList(),
          ],
        ),
      ),
    );
  }
}

//Widget for displaying list of dogs
class DogsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference dogs = FirebaseFirestore.instance.collection('dogs');

    final Query myDogs = dogs.where("uid", isEqualTo: uid);

    return StreamBuilder<QuerySnapshot>(
      stream: myDogs.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //If firebase has data display it as a list
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var post = snapshot.data!.docs[index];
                var age = post['age'].toString();
                var sex = post['sex'];
                var fav = post['favorite'];
                return ListTile(
                    //Go to details screen on tap, send necessary info to details screen
                    onTap: () {
                      pushNewEntry(context, post['url'], post['status'],
                          post['name'], dogs.doc(post.id));
                    },
                    leading: Icon(MyFlutterApp.dog),
                    title: Text(
                      post['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text('Age: $age\nSex: $sex'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: fav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: fav ? Colors.red : null,
                      onPressed: () {
                        dogs.doc(post.id).update({'favorite': !fav});
                      },
                    ));
              });
        }
        //If firebase has no data use circular loading picture
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//Widget for displaying list of cats
class CatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference cats = FirebaseFirestore.instance.collection('cats');
    final Query myCats = cats.where("uid", isEqualTo: uid);

    return StreamBuilder<QuerySnapshot>(
      stream: myCats.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //If firebase has data display it as a list
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var post = snapshot.data!.docs[index];
                var age = post['age'].toString();
                var sex = post['sex'];
                var fav = post['favorite'];
                return ListTile(
                    //Go to details screen on tap, send necessary info to details screen
                    onTap: () {
                      pushNewEntry(context, post['url'], post['status'],
                          post['name'], cats.doc(post.id));
                    },
                    leading: Icon(MyFlutterApp.cat),
                    title: Text(
                      post['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text('Age: $age\nSex: $sex'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: fav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: fav ? Colors.red : null,
                      onPressed: () {
                        cats.doc(post.id).update({'favorite': !fav});
                      },
                    ));
              });
        }
        //If firebase has no data use circular loading picture
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//Widget for displaying list of others
class OthersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference others =
        FirebaseFirestore.instance.collection('others');
    final Query myOthers = others.where("uid", isEqualTo: uid);

    return StreamBuilder<QuerySnapshot>(
      stream: myOthers.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //If firebase has data display it as a list
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var post = snapshot.data!.docs[index];
                var age = post['age'].toString();
                var sex = post['sex'];
                var fav = post['favorite'];
                return ListTile(
                    //Go to details screen on tap, send necessary info to details screen
                    onTap: () {
                      pushNewEntry(context, post['url'], post['status'],
                          post['name'], others.doc(post.id));
                    },
                    leading: Icon(MyFlutterApp.pastafarianism),
                    title: Text(
                      post['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text('Age: $age\nSex: $sex'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: fav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: fav ? Colors.red : null,
                      onPressed: () {
                        others.doc(post.id).update({'favorite': !fav});
                      },
                    ));
              });
        }
        //If firebase has no data use circular loading picture
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}