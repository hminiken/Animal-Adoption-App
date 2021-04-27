import 'package:animal_adoption_app/classes/theme.dart';
import 'package:flutter/material.dart';

bool isGoodAnimals = false, isGoodChildren = false, isMustLeash = false;

Widget buildNewProfileTextField(BuildContext context, String label) {
  return TextFormField(
      onSaved: (value) {},
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ));
}

Widget fillBG(BuildContext context) {
  // return Stack(
  //   children: <Widget>[
  //     //image code
  //     Image.asset(
  //       'assets/images/faded-background.png',
  //       fit: BoxFit.fitHeight,
  //       height: 1000,
  //     ),
  //     //top grey shadow
  //     Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //         height: 200,
  //         width: double.infinity,
  //         decoration: new BoxDecoration(
  //           gradient: new LinearGradient(
  //             end: const Alignment(0.0, 0.4),
  //             begin: const Alignment(0.0, -1),
  //             colors: <Color>[
  //               const Color(0x8A000000),
  //               Colors.white.withOpacity(0.0)
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     //bottom grey shadow
  //     Align(
  //       alignment: Alignment.bottomCenter,
  //       child: Container(
  //         height: 900,
  //         width: double.infinity,
  //         decoration: new BoxDecoration(
  //           gradient: new LinearGradient(
  //             end: const Alignment(0.0, -1),
  //             begin: const Alignment(0.0, 0.4),
  //             colors: <Color>[
  //               Colors.white.withOpacity(0.9),
  //               Colors.white.withOpacity(0.0)
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Column(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       Container(
  //           decoration: BoxDecoration(
  //         // color: colRed,
  //         image: DecorationImage(
  //             image: ExactAssetImage('assets/images/faded-background.png'),
  //             // width: 50.0,
  //             fit: BoxFit.cover),
  //         // borderRadius: BorderRadius.only(
  //         //     bottomLeft: Radius.elliptical(300, 75),
  //         //     bottomRight: Radius.elliptical(300, 75))
  //       )),
  //       Align(
  //           alignment: Alignment.center,
  //           child: Text('Select a State: ',
  //               style: Theme.of(context).textTheme.headline5)),
  //       SizedBox(height: 15),
  //       DropdownButtonFormField(
  //         items: dropdownItems.map((String category) {
  //           return new DropdownMenuItem(
  //               value: category,
  //               child: Row(
  //                 children: <Widget>[
  //                   // Icon(Icons.star),
  //                   Text(category),
  //                 ],
  //               ));
  //         }).toList(),
  //         onChanged: (newValue) {
  //           // do other stuff with _category
  //           //  setState(() => _category = newValue);
  //         },
  //         value: currentVal,
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
  //           // filled: true,
  //           // fillColor: Colors.grey[200],
  //           //  hintText: Localization.of(context).category,
  //           //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
  //         ),
  //       ),
  //       SizedBox(height: 30),
  //       SizedBox(
  //         width: double.infinity,
  //         height: 40,
  //         child: Semantics(
  //           child: ElevatedButton(
  //             child: Text("Go"),
  //             onPressed: () {},
  //             style: ElevatedButton.styleFrom(
  //                 primary: colRed, // background
  //                 onPrimary: Colors.white, // foreground
  //                 textStyle:
  //                     TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  //           ),
  //           button: true,
  //           enabled: true,
  //           onTapHint: 'View Animals',
  //         ),
  //       )
  //     ])
  //   ],
  // );
}

//  Widget gradientFillBackground(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10.0),
//       width: 240,
//       height: 480,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blueGrey,
//                     blurRadius: 5,
//                     offset: Offset(0, 7),
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: ExactAssetImage(
//                      'assets/images/faded-background.png'
//                 ),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.red,
//                     Colors.transparent,
//                     Colors.transparent,
//                     Colors.red
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0, 0, 0.6, 1],
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//                     //place this container to right side
//                     constraints: BoxConstraints(maxWidth: 240.0),
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         color: Colors.white.withOpacity(0.8)),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.directions_bike,
//                           color: Colors.red,
//                         ),
//                         Text(
//                           '5',
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   //display event name, start/end dates times and duration in a column
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NAME',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0)),
//                       SizedBox(
//                         height: 3.0,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ),
//         ],
//       ),
//     );
//   }
