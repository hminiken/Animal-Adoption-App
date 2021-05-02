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
  final bool dispoisition2;
  final bool disposition3;
  final String email;
  final String phone;

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
      required this.disposition1,
      required this.dispoisition2,
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
          return Column(children: [
            Expanded(child: animalInfo()),
            DetailsButton(email, phone)
          ]);
        } else {
          return Container(
            child: landscape(),
          );
        }
      })),
    );
  }

  //For Display animal info for landscape view
  Widget landscape() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Expanded(
            child: Row(children: [
          Flexible(fit: FlexFit.tight, child: displayImage()),
          Spacer(),
          Flexible(
              child: Column(children: [
            showName(),
            showAge(),
            showGender(),
            showDisposition(),
            showAbout(),
          ])),
        ])),
        DetailsButton(email, phone)
      ]),
    );
  }

  //Display the animal's info
  Widget animalInfo() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Expanded(child: displayImage()),
        showName(),
        SizedBox(height: 10),
        showAge(),
        SizedBox(height: 5),
        showGender(),
        SizedBox(height: 5),
        showDisposition(),
        SizedBox(height: 5),
        showAbout()
      ]),
    );
  }

  //Display image of animal
  Widget displayImage() {
    return Container(
        padding: EdgeInsets.all(15),
        child: Image.network(
          'https://www.sftravel.com/sites/sftravel.prod.acquia-sites.com/files/field/image/dog.jpg',
          loadingBuilder: (context, child, progress) {
            return progress == null ? child : LinearProgressIndicator();
          },
        ));
  }

  Widget showName() {
    return Row(
      children: [
        Text('$name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget showAge() {
    return Row(
      children: [
        Text('Age: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$age')
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget showGender() {
    return Row(
      children: [
        Text('Gender: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$sex')
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget showDisposition() {
    return Row(
      children: [
        Text(
          'Disposition: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        disposition1 ? Text('A kind disposition. ') : Text(''),
        dispoisition2 ? Text('A sad disposition. ') : Text(''),
        disposition3 ? Text('A mean disposition. ') : Text('')
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget showAbout() {
    return Row(
      children: [
        Text('About: ', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('$about')
      ],
      mainAxisAlignment: MainAxisAlignment.start,
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
        flex: 1,
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
