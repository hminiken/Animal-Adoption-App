import 'select_location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/my_flutter_app_icons.dart';
import 'details.dart';

//List screen Widget
class Lists extends StatefulWidget {
  static const routeName = '/lists_page';

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //       primarySwatch: Colors.teal,
    //       fontFamily: GoogleFonts.gabriela().fontFamily),
    //   home:
    //

    final LocationArguments args =
        ModalRoute.of(context)!.settings.arguments as LocationArguments;

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
          title: Text('Cuddler'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            DogsList(location: args.location),
            CatsList(location: args.location),
            OthersList(location: args.location),
          ],
        ),
      ),
    );
  }
}

//Widget for displaying list of dogs
class DogsList extends StatelessWidget {
  final String location;

  DogsList({required this.location});

  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference dogs = FirebaseFirestore.instance.collection('dogs');
    final Query localDogs = dogs.where("location", isEqualTo: location);

    return StreamBuilder<QuerySnapshot>(
      stream: localDogs.snapshots(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    age: post['age'],
                                    url: post['url'],
                                    sex: post['sex'],
                                    about: post['about'],
                                    name: post['name'],
                                    disposition1: post['disposition1'],
                                    disposition2: post['disposition2'],
                                    disposition3: post['disposition3'],
                                    phone: post['phone'],
                                    email: post['email'],
                                  )));
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
  final String location;

  CatsList({required this.location});

  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference cats = FirebaseFirestore.instance.collection('cats');
    final Query localCats = cats.where("location", isEqualTo: location);

    return StreamBuilder<QuerySnapshot>(
      stream: localCats.snapshots(),
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

                //post[id] in listfavorites = true
                //fav = true
                //else fav = false
                return ListTile(
                    //Go to details screen on tap, send necessary info to details screen
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    age: post['age'],
                                    url: post['url'],
                                    sex: post['sex'],
                                    about: post['about'],
                                    name: post['name'],
                                    disposition1: post['disposition1'],
                                    disposition2: post['disposition2'],
                                    disposition3: post['disposition3'],
                                    phone: post['phone'],
                                    email: post['email'],
                                  )));
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
  final String location;

  OthersList({required this.location});
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference others =
        FirebaseFirestore.instance.collection('others');
    final Query localOthers = others.where("location", isEqualTo: location);

    return StreamBuilder<QuerySnapshot>(
      stream: localOthers.snapshots(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    age: post['age'],
                                    url: post['url'],
                                    sex: post['sex'],
                                    about: post['about'],
                                    name: post['name'],
                                    disposition1: post['disposition1'],
                                    disposition2: post['disposition2'],
                                    disposition3: post['disposition3'],
                                    phone: post['phone'],
                                    email: post['email'],
                                  )));
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
