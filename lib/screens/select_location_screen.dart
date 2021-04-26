import 'package:animal_adoption_app/classes/theme.dart';
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
          title: const Center(child: Text('Select a Location')),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: Text('Select a State: ',
                      style: Theme.of(context).textTheme.headline5)),
              SizedBox(height: 15),
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
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Semantics(
                  child: ElevatedButton(
                    child: Text("Go"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: colRed, // background
                        onPrimary: Colors.white, // foreground
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  button: true,
                  enabled: true,
                  onTapHint: 'View Animals',
                ),
              )
            ])));
  }
}
