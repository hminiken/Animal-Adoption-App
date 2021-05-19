import 'select_location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/my_flutter_app_icons.dart';
import 'details.dart';
import '../models/constants.dart';

//List screen Widget
class Lists extends StatefulWidget {
  static const routeName = '/lists_page';

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {

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
class DogsList extends StatefulWidget {
  final String location;

  DogsList({required this.location});

  @override
  _DogsListState createState() => _DogsListState();
}

class _DogsListState extends State<DogsList> {
  String dropdownValue = 'Sort by All';

  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference dogs = FirebaseFirestore.instance.collection('dogs');
    final Query localDogs = dogs.where("location", isEqualTo: widget.location);
    Query sortBy = localDogs.where("breed", isEqualTo: dropdownValue);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Constants.tealBlue,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    sortBy = localDogs.where("breed", isEqualTo: dropdownValue);
                  });
                },
                items: <String>[
                  'Retriever (Labrador)',
                  'French Bulldog',
                  'German Shepherd Dog',
                  'Retriever (Golden)',
                  'Bulldog',
                  'Poodle',
                  'Beagle',
                  'Rottweiler',
                  'Pointer (German Shorthaired)',
                  'Dachshund',
                  'Pembroke Welsh Corgi',
                  'Australian Shepherd',
                  'Yorkshire Terrier',
                  'Boxer',
                  'Great Dane',
                  'Other - Please Specify',
                  'Sort by All'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ),
      StreamBuilder<QuerySnapshot>(
        stream: dropdownValue == 'Sort by All'
            ? localDogs.snapshots()
            : sortBy.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //If firebase has data display it as a list
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            return ListView.builder(
                shrinkWrap: true,
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
                                      location: post['location'],
                                      status: post['status'],
                                      breed: post['breed'],
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
      )
    ]);
  }
}

//Widget for displaying list of cats
class CatsList extends StatefulWidget {
  final String location;

  CatsList({required this.location});

  @override
  _CatsListState createState() => _CatsListState();
}

class _CatsListState extends State<CatsList> {
  String dropdownValue = 'Sort by All';
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference cats = FirebaseFirestore.instance.collection('cats');
    final Query localCats = cats.where("location", isEqualTo: widget.location);
    Query sortBy = localCats.where("breed", isEqualTo: dropdownValue);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Constants.tealBlue,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    sortBy = localCats.where("breed", isEqualTo: dropdownValue);
                  });
                },
                items: <String>[
                  'Domestic Shorthair',
                  'American Shorthair',
                  'Domestic Longhair',
                  'Maine Coon',
                  'Siamese',
                  'Russian Blue',
                  'Ragdoll',
                  'Bengal',
                  'Persian',
                  'Bombay',
                  'Other - Please Specify',
                  'Sort by All'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ),
      StreamBuilder<QuerySnapshot>(
        stream: dropdownValue == 'Sort by All'
            ? localCats.snapshots()
            : sortBy.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //If firebase has data display it as a list
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            return ListView.builder(
                shrinkWrap: true,
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
                                      location: post['location'],
                                      status: post['status'],
                                      breed: post['breed'],
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
      )
    ]);
  }
}

//Widget for displaying list of others
class OthersList extends StatefulWidget {
  final String location;

  OthersList({required this.location});

  @override
  _OthersListState createState() => _OthersListState();
}

class _OthersListState extends State<OthersList> {
  String dropdownValue = 'Sort by All';
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference others =
        FirebaseFirestore.instance.collection('others');
    final Query localOthers =
        others.where("location", isEqualTo: widget.location);
    Query sortBy = localOthers.where("breed", isEqualTo: dropdownValue);

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Constants.tealBlue,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    sortBy = sortBy.where("breed", isEqualTo: dropdownValue);
                  });
                },
                items: <String>[
                  'Rabbit',
                  'Bird',
                  'Fish',
                  'Ferret',
                  'Hamster',
                  'Turtle',
                  'Snake',
                  'Crab',
                  'Guinea Pig',
                  'Other - Please Specify',
                  'Sort by All'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ),
      StreamBuilder<QuerySnapshot>(
        stream: dropdownValue == 'Sort by All'
            ? localOthers.snapshots()
            : sortBy.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //If firebase has data display it as a list
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            return ListView.builder(
                shrinkWrap: true,
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
                                      location: post['location'],
                                      status: post['status'],
                                      breed: post['breed'],
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
      )
    ]);
  }
}
