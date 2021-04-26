import 'package:animal_adoption_app/classes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animal_adoption_app/widgets/global_widgets.dart';

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
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Container(
          height: 50,
          child: centerText(context, 'View My Listed Pets', Colors.black, 16),
        ),
        Container(
          height: 50,
          child: centerText(context, 'Edit mm Information', Colors.black, 16),
        ),
        Container(
          height: 50,
          // color: Colors.amber[100],
          child: centerText(context, 'About Cuddler™', Colors.black, 16),
        ),
      ],
    ))
  ]);
}
