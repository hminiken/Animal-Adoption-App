import 'package:animal_adoption_app/classes/theme.dart';
import 'package:flutter/material.dart';

class UpdateStatus extends StatefulWidget {
  static const routeName = '/update_status_screen';
  // static const routeName = '/';
  @override
  UpdateStatusState createState() => UpdateStatusState();
}

class UpdateStatusState extends State<UpdateStatus> {
  @override
  void initState() {
    super.initState();
  }

  var dropdownItems = ['Available', 'Pending', 'Not Available', 'Adopted'];

  var currentVal = null;
  var currentPet = "Lassie";
  var currentStatus = "Available";

  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: cuddlerAppBar(context, 'Select a Location'),
      appBar: AppBar(
        title: Text('Change the Status of Your Pet'),
        centerTitle: true,
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
                ElevatedButton.icon(
                  label: const Text(
                    'Update',
                    style: TextStyle(fontSize: 20),
                  ),
                  icon: const Icon(Icons.update_outlined),
                  // backgroundColor: colDarkBlue,
                  //
                  onPressed: () {},

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colDarkBlue), // background
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))
                      // foreground
                      // textStyle:
                      //     TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                      ),
                ),
                SizedBox(height: 50),
              ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: Semantics(
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Delete'),
          icon: const Icon(Icons.delete_forever),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
