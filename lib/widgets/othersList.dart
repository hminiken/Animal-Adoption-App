import '../pages/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/my_flutter_app_icons.dart';
import '../models/constants.dart';

//Widget for displaying list of others
class OthersList extends StatefulWidget {
  final String location;

  OthersList({required this.location});

  @override
  _OthersListState createState() => _OthersListState();
}

class _OthersListState extends State<OthersList> {
  String dropdownValue = 'Sort by All Breeds';
  String dropdownValue2 = 'Sort by All Dispositions';
  String dropdownValue3 = 'Sort by All Dates Added';
  bool dis1 = false;
  bool dis2 = false;
  bool dis3 = false;
  @override
  Widget build(BuildContext context) {
    //For comparing time
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    var now = ms / 1000;
    var oneWeekAgo = now - (86400 * 7);
    var oneMonthAgo = now - (86400 * 30);

    //Grab the collection from firebase
    CollectionReference others =
        FirebaseFirestore.instance.collection('others');
    final Query localOthers =
        others.where("location", isEqualTo: widget.location);
    Query sortBy = localOthers.where("breed", isEqualTo: dropdownValue);

    //Sorting logic for boolean dispositions
    if (dis1 == true) {
      if (dropdownValue == 'Sort by All Breeds') {
        sortBy = localOthers.where("disposition1", isEqualTo: true);
        dis1 = false;
      } else {
        sortBy = localOthers
            .where("breed", isEqualTo: dropdownValue)
            .where("disposition1", isEqualTo: true);
        dis1 = false;
      }
    } else if (dis2 == true) {
      if (dropdownValue == 'Sort by All Breeds') {
        sortBy = localOthers.where("disposition2", isEqualTo: true);
        dis2 = false;
      } else {
        sortBy = localOthers
            .where("breed", isEqualTo: dropdownValue)
            .where("disposition2", isEqualTo: true);
        dis2 = false;
      }
    } else if (dis3 == true) {
      if (dropdownValue == 'Sort by All Breeds') {
        sortBy = localOthers.where("disposition3", isEqualTo: true);
        dis2 = false;
      } else {
        sortBy = localOthers
            .where("breed", isEqualTo: dropdownValue)
            .where("disposition3", isEqualTo: true);
        dis2 = false;
      }
    }

    //Sorting logic
    if (dropdownValue3 == 'Added within One Week') {
      if (dropdownValue == 'Sort by All Breeds' &&
          dropdownValue2 == 'Sort by All Dispositions') {
        sortBy = localOthers.where("dateAdded", isGreaterThan: oneWeekAgo);
      } else if (dropdownValue != 'Sort by All Breeds' &&
          dropdownValue2 == 'Sort by All Dispositions') {
        sortBy = localOthers
            .where("Breed", isEqualTo: dropdownValue)
            .where("dateAdded", isGreaterThan: oneWeekAgo);
      }
    } else if (dropdownValue3 == 'Added within One Month') {
      if (dropdownValue == 'Sort by All Breeds' &&
          dropdownValue2 == 'Sort by All Dispositions') {
        sortBy = localOthers.where("dateAdded", isGreaterThan: oneMonthAgo);
      } else if (dropdownValue != 'Sort by All Breeds' &&
          dropdownValue2 == 'Sort by All Dispositions') {
        sortBy = localOthers
            .where("breed", isEqualTo: dropdownValue)
            .where("dateAdded", isGreaterThan: oneMonthAgo);
      }
    }

    return Column(children: [
      Row(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButton<String>(
                    isExpanded: true,
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
                      'Sort by All Breeds'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ))),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_downward),
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Constants.tealBlue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                        if (dropdownValue2 == 'Good with other animals') {
                          dis1 = true;
                        } else if (dropdownValue2 == 'Good with children') {
                          dis2 = true;
                        } else if (dropdownValue2 ==
                            'Animal must be leashed at all times') {
                          dis3 = true;
                        } else {
                          dis1 = false;
                          dis2 = false;
                          dis3 = false;
                        }
                      });
                    },
                    items: <String>[
                      'Good with other animals',
                      'Good with children',
                      'Animal must be leashed at all times',
                      'Sort by All Dispositions',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ))),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue3,
                    icon: const Icon(Icons.arrow_downward),
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Constants.tealBlue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue3 = newValue!;
                      });
                    },
                    items: <String>[
                      'Added within One Week',
                      'Added within One Month',
                      'Sort by All Dates Added'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ))),
        ],
      ),
      Flexible(
          child: StreamBuilder<QuerySnapshot>(
        stream: dropdownValue == 'Sort by All Breeds' &&
                dropdownValue2 == 'Sort by All Dispositions' &&
                dropdownValue3 == 'Sort by All Dates Added'
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
                                      breed: post['breed'],
                                      status: post['status'],
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
      ))
    ]);
  }
}
