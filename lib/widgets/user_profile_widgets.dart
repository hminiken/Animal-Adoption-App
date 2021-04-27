import 'package:animal_adoption_app/classes/theme.dart';
import 'package:animal_adoption_app/screens/update_status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animal_adoption_app/widgets/global_widgets.dart';

void pushViewEntry(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(
    routeName,
    // arguments:
  );
}

final List<String> profileOptions = [
  'View My Listed Pets',
  'Edit My Information',
  'About Cuddler™'
];
final List<String> optionRoute = [
  UpdateStatus.routeName,
  '/',
  '/'
]; //last two are place holders, screens not created yet

Widget buildUserProfileBody(BuildContext context) {
  return Column(children: [
    Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: colYellow,
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image.asset(
                'assets/images/sampleCat.jpg',
                height: 125.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerText(context, 'Hillary', Colors.white, 24),
          SizedBox(height: 5),
          centerText(context, '5 Pets Adopted', Colors.white, 14),
          SizedBox(height: 25),
        ]),
        decoration: BoxDecoration(
            color: colRed,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(300, 75),
                bottomRight: Radius.elliptical(300, 75)))),
    SizedBox(height: 10),
    Expanded(
        child: ListView.builder(
            itemCount: profileOptions.length,
            itemBuilder: (context, index) {
              return buildListItem(context, index);
            })

        // ListView(
        //   padding: const EdgeInsets.all(8),
        //   children: [
        //     Container(
        //       height: 50,
        //       child: centerText(context, 'View My Listed Pets', Colors.black, 16),
        //     ),
        //     Container(
        //       height: 50,
        //       child: centerText(context, 'Edit My Information', Colors.black, 16),
        //     ),
        //     Container(
        //       height: 50,
        //       // color: Colors.amber[100],
        //       child: centerText(context, 'About Cuddler™', Colors.black, 16),
        //     ),
        //   ],
        // )

        )
  ]);
}

Widget buildListItem(BuildContext context, int index) {
  var textTheme = Theme.of(context).textTheme;

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]))),
          child: ListTile(
            title: Text(
              profileOptions[index],
              style: textTheme.subtitle2,
            ),
            onTap: () => pushViewEntry(context, optionRoute[index]),
          )));
}
