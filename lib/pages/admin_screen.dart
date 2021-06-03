import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuddler/models/animals.dart';
import 'package:cuddler/pages/new_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'new_profile_screen.dart';
import 'user_listed_pets.dart';
import 'admin_update_user.dart';
import '../models/constants.dart';
import '../models/user_model.dart';
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
                    animals: FirebaseFirestore.instance.collection('dogs'),
                    type: 'Dog')),
            buildStack(
                'Cat',
                AnimalsList(
                    animals: FirebaseFirestore.instance.collection('cats'),
                    type: 'Cat')),
            buildStack(
                'Extra',
                AnimalsList(
                    animals: FirebaseFirestore.instance.collection('others'),
                    type: 'Other')),
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

void pushAdminEdit(
    BuildContext context, String routeName, CuddlerUser currentUser) {
  Navigator.of(context).pushNamed(routeName, arguments: currentUser);
}

//Widget for displaying list of users
class UsersList extends StatelessWidget {
  final currUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    CuddlerUser currentUser = new CuddlerUser(
        userID: '',
        fName: '',
        email: '',
        phoneNumber: '',
        accountType: 1,
        userLocation: '',
        profileImgURL: '');
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
                          print(post.data());
                          // currentUser.userID = users.doc(post.id).toString();
                          currentUser.userID = post.id;
                          currentUser.fName = username;
                          currentUser.email = email;
                          currentUser.phoneNumber = post['phoneNumber'];
                          currentUser.accountType = post['accountType'];
                          currentUser.userLocation = post['userLocation'];
                          currentUser.profileImgURL = pic;
                          //navigate to edit user screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditUserViaAdmin(editUser: currentUser)),
                          );
                          // pushAdminEdit(
                          //     context, EditUserViaAdmin.routeName, currentUser);
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
  AnimalsList({Key? key, required this.animals, required this.type})
      : super(key: key);
  final CollectionReference animals;
  final String type;

  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<AnimalsList> {
  @override
  Widget build(BuildContext context) {
    Animals currentPet = new Animals(
        about: "",
        age: 1,
        disposition1: false,
        disposition2: false,
        disposition3: false,
        email: "",
        name: "",
        phone: "",
        contactName: "",
        sex: "",
        url: "",
        breed: "",
        favorite: false,
        location: "Alabama",
        animalID: "",
        categoryName: "",
        status: "",
        isUpdate: true);

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
                          currentPet.about = profile['about'];
                          currentPet.age = profile['age'];
                          currentPet.disposition1 = profile['disposition1'];
                          currentPet.disposition2 = profile['disposition2'];
                          currentPet.disposition3 = profile['disposition3'];
                          currentPet.email = profile['email'];
                          currentPet.name = profile['name'];
                          currentPet.phone = profile['phone'];
                          currentPet.contactName = profile['contactName'];
                          currentPet.sex = profile['sex'];
                          currentPet.url = profile['url'];
                          currentPet.breed = profile['breed'];
                          currentPet.favorite = profile['favorite'];
                          currentPet.location = profile['location'];
                          currentPet.status = profile['status'];

                          currentPet.categoryName = widget.type;

                          currentPet.animalID =
                              widget.animals.doc(profile.id).toString();
                          pushViewListPet(context, NewProfile.routeName, true,
                              currentPet, widget.animals.doc(profile.id));
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
