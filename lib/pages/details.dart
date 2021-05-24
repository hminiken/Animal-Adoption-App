import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  //Constructor storage
  final int age;
  final String sex;
  final String url;
  final String about;
  final String name;
  final bool disposition1;
  final bool disposition2;
  final bool disposition3;
  final String email;
  final String phone;
  final String location;
  final String breed;

  //Constructor to pass data from the list screen for the details screen
  const Details(
      {Key? key,
      required this.age,
      required this.sex,
      required this.about,
      required this.url,
      required this.name,
      required this.email,
      required this.phone,
      required this.location,
      required this.breed,
      required this.disposition1,
      required this.disposition2,
      required this.disposition3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(children: [animalInfo(), DetailsButton(email, phone)]);
        } else {
          return landscape();
        }
      })),
    );
  }

  //For Display animal info for landscape view
  Widget landscape() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Row(children: [
          Expanded(child: displayImage()),
          Spacer(),
          Expanded(
              child: Column(children: [
            showName(),
            SizedBox(height: 5),
            showAge(),
            SizedBox(height: 5),
            showGender(),
            SizedBox(height: 5),
            showBreed(),
            SizedBox(height: 5),
            showLocation(),
            SizedBox(height: 5),
            showDisposition(),
            SizedBox(height: 5),
            showAboutLandscape(),
          ])),
        ]),
        DetailsButton(email, phone)
      ]),
    );
  }

  //Display the animal's info
  Widget animalInfo() {
    return Expanded(
      child: Column(children: [
        Expanded(flex: 4, child: displayImage()),
        Expanded(flex: 2, child: showName()),
        Expanded(child: showAge()),
        Expanded(child: showGender()),
        Expanded(child: showBreed()),
        Expanded(child: showLocation()),
        Expanded(child: showDisposition()),
        Expanded(child: showAbout()),
      ]),
    );
  }

  //Display image of animal
  Widget displayImage() {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Image.network(
          url,
          loadingBuilder: (context, child, progress) {
            return progress == null ? child : LinearProgressIndicator();
          },
        ));
  }

  Widget showBreed() {
    return Wrap(
      children: [
        Text('Breed: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$breed')
      ],
    );
  }

  Widget showLocation() {
    return Wrap(
      children: [
        Text('Location: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$location')
      ],
    );
  }

  Widget showName() {
    return Wrap(
      children: [
        Text('$name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ],
    );
  }

  Widget showAge() {
    return Wrap(
      children: [
        Text('Age: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$age')
      ],
    );
  }

  Widget showGender() {
    return Wrap(
      children: [
        Text('Gender: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$sex')
      ],
    );
  }

  Widget showDisposition() {
    return Wrap(
      children: [
        Text(
          'Disposition: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        disposition1 ? Text('A kind disposition. ') : Text(''),
        disposition2 ? Text('A sad disposition. ') : Text(''),
        disposition3 ? Text('A mean disposition. ') : Text('')
      ],
    );
  }

  Widget showAbout() {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Wrap(
          children: [
            Text('About: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '$about',
            )
          ],
        ));
  }

  Widget showAboutLandscape() {
    return Wrap(
          children: [
            Text('About: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '$about',
              overflow: TextOverflow.ellipsis,
            )
          ],
        );
  }
}

//Button to open contact info
class DetailsButton extends StatelessWidget {
  DetailsButton(this.email, this.phone);

  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text('Contact'),
                  onPressed: () {
                    final snackBar = SnackBar(
                        duration: Duration(days: 1),
                        content: Container(
                            height: 40,
                            child: Column(children: [
                              Row(
                                children: [
                                  Text('Email: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: GoogleFonts.gabriela()
                                              .fontFamily)),
                                  Text(
                                    '$email',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.gabriela().fontFamily),
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    'Phone: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.gabriela().fontFamily),
                                  ),
                                  Text('$phone',
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.gabriela()
                                              .fontFamily))
                                ],
                              )
                            ])),
                        action: SnackBarAction(
                          label: 'Close Tab',
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ))));
  }
}
