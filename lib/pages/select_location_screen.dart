import 'package:cuddler/classes/theme.dart';
import 'package:cuddler/models/constants.dart';
import 'package:cuddler/pages/lists.dart';
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

  void pushViewEntry(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(
      routeName,
      // arguments:
    );
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
            Image.asset(
              'assets/images/faded-background.png',
              fit: BoxFit.cover,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    end: const Alignment(0.0, -1.9),
                    begin: const Alignment(0.0, 0.0),
                    colors: <Color>[
                      Colors.white.withOpacity(0.95),
                      Colors.white.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ),
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
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
            child: Text('Set Your Location',
                style: Theme.of(context).textTheme.headline4)),
        Align(
            alignment: Alignment.center,
            child: Text('and find your next pet!',
                style: Theme.of(context).textTheme.subtitle1)),
        SizedBox(height: 15),
        ElevatedButton.icon(
          label: const Text(
            'Use My Current Location',
            style: TextStyle(fontSize: 16),
          ),
          icon: const Icon(Icons.location_on),
          // backgroundColor: colDarkBlue,
          onPressed: () {},

          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(colDarkBlue), // background
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
            child: Text('Choose Manually Instead',
                style: Theme.of(context).textTheme.subtitle1)),
        SizedBox(
            width: MediaQuery.of(context).size.width,
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
                // filled: true,
                // fillColor: Colors.grey[200],
                //  hintText: Localization.of(context).category,
                //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
              ),
            )),
        SizedBox(height: 30),
        ElevatedButton.icon(
          label: const Text(
            'Find My Next Pet!',
            style: TextStyle(fontSize: 20),
          ),
          icon: const Icon(Icons.favorite_rounded),
          // backgroundColor: colDarkBlue,
          onPressed: () {
            pushViewEntry(context, Lists.routeName);
          },

          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(colRed), // background
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
    );
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
                color: colDarkBlue,
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
              SizedBox(height: 50),
              Align(
                  alignment: Alignment.center,
                  child: Text('Choose Manually Instead',
                      style: Theme.of(context).textTheme.subtitle1)),
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
                      // filled: true,
                      // fillColor: Colors.grey[200],
                      //  hintText: Localization.of(context).category,
                      //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                    ),
                  )),
              SizedBox(height: 30),
              ElevatedButton.icon(
                label: const Text(
                  'Find My Next Pet!',
                  style: TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.favorite_rounded),
                // backgroundColor: colDarkBlue,
                onPressed: () {},

                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(colRed), // background
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
