import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/widgets/new_profile_widgets.dart';
import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  static const routeName = '/new_profile_screen';
  // static const routeName = '/';
  @override
  NewProfileState createState() => NewProfileState();
}

class NewProfileState extends State<NewProfile> {
  @override
  void initState() {
    super.initState();
    // loadJournal();
  }

  final formKey = GlobalKey<FormState>();

  var petCategories = ["Dog", "Cat", "Other"];

  bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

  void isGoodAnimalsChanged(bool value) =>
      setState(() => isGoodAnimals = value);

  void isGoodChildrenChanged(bool value) =>
      setState(() => isGoodChildren = value);

  void isMustLeashChanged(bool value) => setState(() => isMustLeash = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('List a Pet'))),

      // === Pet Information ===
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Pet Information: ',
                    style: Theme.of(context).textTheme.headline5)),
            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Pet Name'),
            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Breed'),
            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Age'),
            SizedBox(height: 10),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 2,
                decoration: InputDecoration(
                    labelText: 'Pet Bio', border: OutlineInputBorder())),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Pet Disposition: ',
                    style: Theme.of(context).textTheme.headline6)),
            CheckboxListTile(
                value: isGoodAnimals,
                onChanged: isGoodAnimalsChanged,
                title: new Text("Good with other animals"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),
            CheckboxListTile(
                value: isGoodChildren,
                onChanged: isGoodChildrenChanged,
                title: new Text("Good with children"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),
            CheckboxListTile(
                value: isMustLeash,
                onChanged: isMustLeashChanged,
                title: new Text("Animal must be leashed at all times"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: colRed),

            // ==== USER INFORMATIon =====
            SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Your Information: ',
                    style: Theme.of(context).textTheme.headline5)),

            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Your Name'),
            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Phone #'),
            SizedBox(height: 10),
            buildNewProfileTextField(context, 'Email'),
            SizedBox(height: 10),
          ],
        )),
      ),

// == Floating Action Button ==
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Semantics(
        child: new FloatingActionButton(
            onPressed: () {},
            tooltip: 'Upload a new picture',
            backgroundColor: colRed,
            child: new Icon(
              Icons.camera_alt_rounded,
            )),
      ),
    );
  }
}
