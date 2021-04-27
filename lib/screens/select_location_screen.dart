import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/widgets/global_widgets.dart';
import 'package:animal_adoption_app/widgets/new_profile_widgets.dart';
import 'package:flutter/material.dart';

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

  var dropdownItems = [
    'Alabama',
    'Alaska',
    'American Samoa',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'District of Columbia',
    'Florida',
    'Georgia',
    'Guam',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Minor Outlying Islands',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Northern Mariana Islands',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Puerto Rico',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'U.S. Virgin Islands',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];

  var currentVal = null;

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
            Image.asset(
              'assets/images/faded-background.png',
              fit: BoxFit.fitHeight,
              height: 1000,
            ),
            //top grey shadow
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    end: const Alignment(0.0, 0.4),
                    begin: const Alignment(0.0, -1),
                    colors: <Color>[
                      const Color(0x8A000000),
                      Colors.white.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ),
            //bottom grey shadow
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 900,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    end: const Alignment(0.0, -1),
                    begin: const Alignment(0.0, 0.4),
                    colors: <Color>[
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      color: colDarkBlue,
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
                    child: Text('Set your location',
                        style: Theme.of(context).textTheme.headline4)),
                Align(
                    alignment: Alignment.center,
                    child: Text('and find your next pet!',
                        style: Theme.of(context).textTheme.subtitle1)),
                SizedBox(height: 15),
                ElevatedButton.icon(
                  label: const Text('Use My Current Location'),
                  icon: const Icon(Icons.location_on),
                  // backgroundColor: colDarkBlue,
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
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.center,
                    child: Text('Choose Manually Instead',
                        style: Theme.of(context).textTheme.subtitle1)),
                SizedBox(height: 5),
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
                  label: const Text('Find My Next Pet!'),
                  icon: const Icon(Icons.favorite_rounded),
                  // backgroundColor: colDarkBlue,
                  onPressed: () {},

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colRed), // background
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
            )
          ],
        )
        // Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Container(
        //       decoration: BoxDecoration(
        //     // color: colRed,
        //     image: DecorationImage(
        //         image: ExactAssetImage('assets/images/faded-background.png'),
        //         // width: 50.0,
        //         fit: BoxFit.cover),
        //     // borderRadius: BorderRadius.only(
        //     //     bottomLeft: Radius.elliptical(300, 75),
        //     //     bottomRight: Radius.elliptical(300, 75))
        //   )),
        //   Align(
        //       alignment: Alignment.center,
        //       child: Text('Select a State: ',
        //           style: Theme.of(context).textTheme.headline5)),
        //   SizedBox(height: 15),
        //   DropdownButtonFormField(
        //     items: dropdownItems.map((String category) {
        //       return new DropdownMenuItem(
        //           value: category,
        //           child: Row(
        //             children: <Widget>[
        //               // Icon(Icons.star),
        //               Text(category),
        //             ],
        //           ));
        //     }).toList(),
        //     onChanged: (newValue) {
        //       // do other stuff with _category
        //       //  setState(() => _category = newValue);
        //     },
        //     value: currentVal,
        //     decoration: InputDecoration(
        //       contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        //       // filled: true,
        //       // fillColor: Colors.grey[200],
        //       //  hintText: Localization.of(context).category,
        //       //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
        //     ),
        //   ),
        //   SizedBox(height: 30),
        //   SizedBox(
        //     width: double.infinity,
        //     height: 40,
        //     child: Semantics(
        //       child: ElevatedButton(
        //         child: Text("Go"),
        //         onPressed: () {},
        //         style: ElevatedButton.styleFrom(
        //             primary: colRed, // background
        //             onPrimary: Colors.white, // foreground
        //             textStyle:
        //                 TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        //       ),
        //       button: true,
        //       enabled: true,
        //       onTapHint: 'View Animals',
        //     ),
        //   )
        // ])

        );
  }
}
