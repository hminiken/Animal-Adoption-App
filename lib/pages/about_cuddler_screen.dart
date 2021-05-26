import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/constants.dart';
import '../widgets/background.dart';

class AboutCuddler extends StatefulWidget {
  static const routeName = '/about_cuddler_screen';
  // static const routeName = '/';
  @override
  AboutCuddlerState createState() => AboutCuddlerState();
}

class AboutCuddlerState extends State<AboutCuddler> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> entries = <String>[
    'Version: 1.0.0',
    'Contact Us',
    'Rate us on Google Play'
  ];
  //
  final List<Icon> dispIcons = <Icon>[
    Icon(Icons.code_outlined),
    Icon(Icons.mail),
    Icon(Icons.play_arrow_rounded)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: cuddlerAppBar(context, 'Select a Location'),
      appBar: AppBar(
        title: Text('About Cuddler'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          //image code
          fadedBackground(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 55),
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(5),
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
              Center(
                  child: Text('Cuddler ',
                      style: GoogleFonts.oleoScriptSwashCaps(
                        textStyle:
                            TextStyle(color: Constants.deepBlue, fontSize: 48),
                      ))),
              SizedBox(height: 5),
              Text(
                  'What better way to match future pet owners up with available animals than a swipe-ready dating app!\n\n',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Constants.deepBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: dispIcons[index],
                    title: Text('${entries[index]}'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ))
            ]),
          )
        ],
      ),

      // Column(children: [
      //   Container(
      //       child: Column(children: [
      //         Container(
      //           padding: EdgeInsets.all(0),
      //           margin: EdgeInsets.all(20),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(100),
      //             border: Border.all(
      //               color: colDarkBlue,
      //               width: 5,
      //             ),
      //           ),
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(80.0),
      //             child: Image.asset(
      //               'assets/images/circleLogo.png',
      //               height: 125.0,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Align(
      //             alignment: Alignment.centerLeft,
      //             child: Center(
      //                 child: Text('Cuddler ',
      //                     style: GoogleFonts.oleoScriptSwashCaps(
      //                       textStyle:
      //                           TextStyle(color: colDarkBlue, fontSize: 48),
      //                     )))),
      //         SizedBox(height: 25),
      //       ]),
      //       decoration: BoxDecoration(
      //           color: colYellow,
      //           borderRadius: BorderRadius.only(
      //               bottomLeft: Radius.elliptical(300, 75),
      //               bottomRight: Radius.elliptical(300, 75)))),
      //   SizedBox(height: 10),
      // ]),
      // == Floating Action Button ==
    );
  }
}
