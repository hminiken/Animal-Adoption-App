import 'package:animal_adoption_app/classes/theme.dart';
import 'package:flutter/material.dart';

class UpdateStatus extends StatefulWidget {
  // static const routeName = '/select_location_screen';
  static const routeName = '/';
  @override
  UpdateStatusState createState() => UpdateStatusState();
}

class UpdateStatusState extends State<UpdateStatus> {
  @override
  void initState() {
    super.initState();
  }

  var dropdownItems = ['Available', 'Pending', 'Not Available', 'Adopted'];

  var currentVal = "Select Status";
  var currentPet = "Lassie";
  var currentStatus = "Available";

  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: cuddlerAppBar(context, 'Select a Location'),
        appBar: AppBar(
          title: const Center(child: Text('Change the Status of Your Pet')),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text('Change the status for ' + currentPet,
                          style: Theme.of(context).textTheme.headline5)),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/sampleCat.jpg',
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                      alignment: Alignment.center,
                      child: Text('Current status is: ' + currentStatus,
                          style: Theme.of(context).textTheme.headline6)),
                  SizedBox(height: 15),
                  DropdownButtonFormField(
                    items: dropdownItems.map((String category) {
                      return new DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              // Icon(Icons.star),
                              Text(category),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      // do other stuff with _category
                      //  setState(() => _category = newValue);
                    },
                    value: currentVal,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      // filled: true,
                      // fillColor: Colors.grey[200],
                      //  hintText: Localization.of(context).category,
                      //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Semantics(
                      child: ElevatedButton(
                        child: Text("Go"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: colRed, // background
                            onPrimary: Colors.white, // foreground
                            textStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      button: true,
                      enabled: true,
                      onTapHint: 'View Animals',
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                      alignment: Alignment.center,
                      child: Text('Or',
                          style: Theme.of(context).textTheme.headline6)),
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Semantics(
                      child: ElevatedButton(
                        child: Text("Delete Listing"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white, // foreground
                            textStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      button: true,
                      enabled: true,
                      onTapHint: 'View Animals',
                    ),
                  ),
                ]))));
  }
}
