import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/constants.dart';
import '../widgets/my_flutter_app_icons.dart';

class AdminPage extends StatefulWidget {
  static const routeName = '/admin_page';

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cuddler'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle_outlined)),
              Tab(icon: Icon(MyFlutterApp.dog)),
              Tab(icon: Icon(MyFlutterApp.cat)),
              Tab(icon: Icon(Icons.pets_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildStack('Users', UsersList()),
            buildStack(
                'Dog',
                AnimalsList(
                    animals: FirebaseFirestore.instance.collection('dogs'))),
            buildStack(
                'Cat',
                AnimalsList(
                    animals: FirebaseFirestore.instance.collection('cats'))),
            buildStack(
                'Extra',
                AnimalsList(
                    animals: FirebaseFirestore.instance.collection('others'))),
          ],
        ),
      ),
    );
  }

  Widget buildStack(String type, Widget list) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.hardEdge,
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.star),
          title: Text((type + ' Profiles').toUpperCase(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 60,
          bottom: 0,
          child: (list),
        ),
      ],
    );
  }
}

//Widget for displaying list of users
class UsersList extends StatelessWidget {
  final currUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    //Grab the collection from firebase
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var post = snapshot.data!.docs[index];
                if (post.id == currUser.uid) {
                  return ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Current User', style: TextStyle(fontSize: 18)),
                    subtitle: Text(
                        'Account cannot be changed or deleted from this screen'),
                  );
                }
                var username = post['fName'];
                var email = post['email'];
                var pic = post['profileImgURL'];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(pic),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    username,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(email),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Constants.deepBlue,
                        onPressed: () {
                          //navigate to update_user_profile
                          users.doc(post.id).update({'fName': 'Bob'});
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Constants.redOrange,
                        onPressed: () {
                          //should we also un-authenticate?
                          users.doc(post.id).delete();
                        },
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//Widget for displaying list of Animal Profiles
class AnimalsList extends StatefulWidget {
  AnimalsList({Key? key, required this.animals}) : super(key: key);
  final CollectionReference animals;

  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<AnimalsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.animals.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var profile = snapshot.data!.docs[index];
                var age = profile['age'].toString();
                var sex = profile['sex'];
                var pic = profile['url'];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(pic),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    profile['name'],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Age: $age Sex: $sex'),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Constants.deepBlue,
                        onPressed: () {
                          //navigate to update_animal_profile
                          widget.animals
                              .doc(profile.id)
                              .update({'name': 'Bob'});
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Constants.redOrange,
                        onPressed: () {
                          widget.animals.doc(profile.id).delete();
                        },
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
