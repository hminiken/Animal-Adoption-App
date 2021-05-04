// import 'package:flutter/material.dart';

// Widget customDropDown(BuildContext context, var dropdownItems, var currentVal) {

//   FormField<String>(
//                 builder: (FormFieldState<String> state) {
//                   return InputDecorator(
//                     decoration: InputDecoration(
//                         // labelStyle: textStyle,
//                           labelText: 'Pet Name',
//                           border: OutlineInputBorder(),
//                         errorStyle:
//                             TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                         hintText: 'Please select expense',
//                         ),
//                     isEmpty: currentVal == '',
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         value: currentVal,
//                         isDense: true,
//                         onChanged: (String newValue) {
//                           setState(() {
//                             currentVal = newValue;
//                             state.didChange(newValue);
//                           });
//                         },
//                         items: dropdownItems.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//               ),

// }
