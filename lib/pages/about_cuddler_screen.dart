import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
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
        body: LayoutBuilder(builder: (context, constraints) {
          return constraints.maxWidth < 500
              ? verticalLayout(context)
              : horizontalLayout(context);
        }));
  }

  Widget verticalLayout(BuildContext context) {
    return Stack(
      children: <Widget>[
        //image code
        fadedBackground(context),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: MediaQuery.of(context).size.width / 50),
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
                  height: MediaQuery.of(context).size.width / 4,
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
            SizedBox(height: 0),
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
    );
  }

  Widget horizontalLayout(BuildContext context) {
    return Stack(children: <Widget>[
      //image code
      fadedBackground(context),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Column(
                        children: [
                          SizedBox(height: 0),
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
                                height: MediaQuery.of(context).size.width / 8,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Cuddler ',
                                      style: GoogleFonts.oleoScriptSwashCaps(
                                        textStyle: TextStyle(
                                            color: Constants.deepBlue,
                                            fontSize: 36),
                                      )))),
                          SizedBox(height: 5),
                          Text(
                              'What better way to match future pet owners up with available animals than a swipe-ready dating app!\n\n',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Constants.deepBlue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ))),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //     child: ListView.separated(
                  //   padding: const EdgeInsets.all(5),
                  //   itemCount: entries.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       leading: dispIcons[index],
                  //       title: Text('${entries[index]}'),
                  //     );
                  //   },
                  //   separatorBuilder: (BuildContext context, int index) =>
                  //       const Divider(),
                  // ))
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: ListTile.divideTiles(
                        //          <-- ListTile.divideTiles
                        context: context,
                        tiles: [
                          ListTile(
                            leading: Icon(Icons.code),
                            title: Text(Constants().appVersion),
                          ),
                          ListTile(
                            leading: Icon(Icons.play_arrow_rounded),
                            title: Text('Rate us on Google Play'),
                            onTap: () {
                              // LaunchReview.launch();
                              LaunchReview.launch(
                                  androidAppId: "com.iyaffle.rangoli",
                                  iOSAppId: "585027354");
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text('Contact Us'),
                          ),
                        ]).toList(),
                  ))
                ],
              ))
            ],
          ))
    ]);

    // child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    //   SizedBox(height: 55),
    //   Container(
    //     padding: EdgeInsets.all(0),
    //     margin: EdgeInsets.all(5),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(200),
    //       border: Border.all(
    //         color: Constants.deepBlue,
    //         width: 5,
    //       ),
    //     ),
    //     child: ClipRRect(
    //       // borderRadius: BorderRadius.circular(80.0),
    //       child: Image.asset(
    //         'assets/images/circleLogo.png',
    //         height: 125.0,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   Center(
    //       child: Text('Cuddler ',
    //           style: GoogleFonts.oleoScriptSwashCaps(
    //             textStyle:
    //                 TextStyle(color: Constants.deepBlue, fontSize: 48),
    //           ))),
    //   SizedBox(height: 5),
    //   Text(
    //       'What better way to match future pet owners up with available animals than a swipe-ready dating app!\n\n',
    //       style: GoogleFonts.poppins(
    //         textStyle: TextStyle(
    //           color: Constants.deepBlue,
    //           fontSize: 14,
    //           fontWeight: FontWeight.w500,
    //         ),
    //       )),
    //   SizedBox(height: 10),
    //         Expanded(
    //             child: ListView.separated(
    //           padding: const EdgeInsets.all(5),
    //           itemCount: entries.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(
    //               leading: dispIcons[index],
    //               title: Text('${entries[index]}'),
    //             );
    //           },
    //           separatorBuilder: (BuildContext context, int index) =>
    //               const Divider(),
    //         ))
    //       ]),
    //     )
    //   ],
    // );
  }
}
