import 'package:cuddler/models/constants.dart';
import 'package:cuddler/pages/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';

import '../widgets/background.dart';

class LocationArguments {
  // final File image;
  String location, status;

  LocationArguments(this.location, this.status);
}

class SelectLocation extends StatefulWidget {
  static const routeName = '/select_location_screen';
  // static const routeName = '/';
  @override
  SelectLocationState createState() => SelectLocationState();
}

class SelectLocationState extends State<SelectLocation> {
  @override
  void initState() {
    super.initState();
  }

  void pushViewEntry(BuildContext context, String location, status) {
    Navigator.of(context).pushNamed(Lists.routeName,
        arguments: LocationArguments(location, status));
  }

  void retrieveLocation() async {
    var locationService = location.Location();
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          Navigator.of(context).pop();
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == location.PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != location.PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
          Navigator.of(context).pop();
          return;
        }
      }
      location.LocationData locationData = await locationService.getLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      print(placemarks);
      setState(() {
        currentVal = placemarks[0].administrativeArea!;
      });
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
    }
  }

  var currentVal = 'Alabama';

  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: cuddlerAppBar(context, 'Select a Location'),
        appBar: AppBar(
          title: Text('Select a Location'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            //image code
            fadedBackground(context),
            LayoutBuilder(builder: (context, constraints) {
              return constraints.maxWidth < 500
                  ? verticalLayout(context)
                  : horizontalLayout(context);
            })
            // horizontalLayout(context)
          ],
        ));
  }

  Widget verticalLayout(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: Border.all(
                  color: Constants.deepBlue,
                  width: 5,
                ),
              ),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(80.0),
                child: Image.asset(
                  'assets/images/circleLogo.png',
                  height: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Set Your Location',
                        style: Theme.of(context).textTheme.headline4))),
            Align(
                alignment: Alignment.center,
                child: Text('and find your next pet!',
                    style: Theme.of(context).textTheme.subtitle1)),
            SizedBox(height: 40),
            ElevatedButton.icon(
              label: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Use My Current Location',
                    style: TextStyle(
                        // fontSize: 20,
                        ),
                  )),
              icon: const Icon(
                Icons.location_on,
                size: 25,
              ),

              // backgroundColor: Constants.deepBlue,
              onPressed: () {
                retrieveLocation();
              },

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Constants.deepBlue), // background
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5))
                  // foreground
                  // textStyle:
                  //     TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  ),
            ),
            SizedBox(height: 50),
            Align(
                alignment: Alignment.center,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Choose Manually Instead',
                        style: Theme.of(context).textTheme.subtitle1))),
            SizedBox(
                width: MediaQuery.of(context).size.width / 3 +
                    MediaQuery.of(context).size.width / 2,
                child: DropdownButtonFormField(
                  items: Constants().statesList.map((String category) {
                    return new DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: <Widget>[
                            // Icon(Icons.star),
                            Text(category),
                          ],
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      currentVal = newValue!;
                    });
                  },
                  value: currentVal,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  ),
                )),
            SizedBox(height: 30),
            ElevatedButton.icon(
              label: const Text(
                'Find My Next Pet!',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.favorite_rounded),
              // backgroundColor: Constants.deepBlue,
              onPressed: () {
                pushViewEntry(context, currentVal, "Available");
              },

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Constants.redOrange), // background
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
          ]),
        ));
  }

  Widget horizontalLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: Constants.deepBlue,
                width: 5,
              ),
            ),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(80.0),
              child: Image.asset(
                'assets/images/circleLogo.png',
                // height: 125.0,
                height: MediaQuery.of(context).size.width / 5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text('Set Your Location',
                  style: Theme.of(context).textTheme.headline4)),
          Align(
              alignment: Alignment.center,
              child: Text('and find your next pet!',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 15),
        ]),
        SizedBox(width: 50),
        // ====== COLUMN 2 ========
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                label: const Text(
                  'Use My Current Location',
                  style: TextStyle(fontSize: 16),
                ),
                icon: const Icon(Icons.location_on),
                // backgroundColor: Constants.deepBlue,
                onPressed: () {
                  retrieveLocation();
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
              Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('Choose Manually Instead',
                          style: Theme.of(context).textTheme.subtitle1))),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: DropdownButtonFormField(
                    items: Constants().statesList.map((String category) {
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
                    ),
                  )),
              SizedBox(height: 30),
              ElevatedButton.icon(
                label: const Text(
                  'Find My Next Pet!',
                  style: TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.favorite_rounded),
                // backgroundColor: Constants.deepBlue,
                onPressed: () {
                  pushViewEntry(context, currentVal, "Available");
                },

                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Constants.redOrange), // background
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
            ]),
      ]),
    );
  }
}
