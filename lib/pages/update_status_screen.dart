import 'package:flutter/material.dart';
import '../models/constants.dart';
import 'user_listed_pets.dart';

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

  var statusValue = 'Available';
  var currentPet = "Lassie";
  var currentStatus = "Available";

  Widget build(BuildContext context) {
    final StatusArguments args =
        ModalRoute.of(context)!.settings.arguments as StatusArguments;

    String petImage = args.imageURL;

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
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Change the status for ' + args.petName,
                            style: Theme.of(context).textTheme.headline5))),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    petImage,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 50),
                Align(
                    alignment: Alignment.center,
                    child: Text('Current status is: ' + args.currentStatus,
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
                  onChanged: (String? curValue) {
                    setState(() {
                      statusValue = curValue!;
                    });
                  },
                  value: statusValue,
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
                  onPressed: () {
                    if(statusValue == "Adopted")
                    {
                      args.id.delete();
                    } else {
                      args.id.update({'status': statusValue});
                    }
                    Navigator.pop(context);
                  },

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.deepBlue), // background
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

                Text("Note: Changing status to 'Adopted' will remove the pet from the database. This action cannot be undone."),
                SizedBox(height: 50),
              ]))),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      // floatingActionButton: Semantics(
      //   child: FloatingActionButton.extended(
      //     onPressed: () {
      //       // Add your onPressed code here!
      //     },
      //     label: const Text('Delete'),
      //     icon: const Icon(Icons.delete_forever),
      //     backgroundColor: Colors.red,
      //   ),
      // ),
    );
  }
}
