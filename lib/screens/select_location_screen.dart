import 'package:flutter/material.dart';


class SelectLocation extends StatefulWidget {
  // static const routeName = '/select_location_screen';
  static const routeName = '/';
  @override
  SelectLocationState createState() => SelectLocationState();
}

class SelectLocationState extends State<SelectLocation> {
  @override
  void initState() {
    super.initState();

  }

 Widget build(BuildContext context) {
   return Scaffold(
    //  appBar: cuddlerAppBar(context, 'Select a Location'),
    appBar: AppBar(
      title: const Text('Select a Location'),
      
    ),
     body: Text("Hello!"),
   );
 }

}