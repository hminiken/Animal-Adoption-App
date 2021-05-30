import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/constants.dart';

class EmailPreferences extends StatefulWidget {
  static const routeName = '/email-preferences';
  @override
  EmailPreferencesState createState() => EmailPreferencesState();
}

class EmailPreferencesState extends State<EmailPreferences> {
  @override
  void initState() {
    super.initState();
  }

  bool isEmailNever = false, isEmailDaily = false, isEmailWeekly = false;

  void isEmailNeverChanged(bool value) {
    setState(() {
      isEmailNever = value;
      isEmailDaily = false;
      isEmailWeekly = false;
    });
  }

  void isEmailDailyChanged(bool value) {
    setState(() {
      isEmailNever = false;
      isEmailDaily = value;
      isEmailWeekly = false;
    });
  }

  void isEmailWeeklyChanged(bool value) {
    setState(() {
      isEmailNever = false;
      isEmailDaily = false;
      isEmailWeekly = value;
    });
  }

  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController displayNameController = new TextEditingController();
    displayNameController.text = "My Name";

    TextEditingController emailController = new TextEditingController();
    emailController.text = "My Email";

    TextEditingController phoneController = new TextEditingController();
    phoneController.text = "My Phone";

    return Scaffold(
        appBar: AppBar(
          title: Text('Update Email Preferences'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              SizedBox(height: 10),
              Form(
                  key: formKey,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        // Container(
                        //   padding: EdgeInsets.all(0),
                        //   margin: EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(200),
                        //     border: Border.all(
                        //       color: Constants.deepBlue,
                        //       width: 5,
                        //     ),
                        //   ),
                        //   child: ClipRRect(
                        //     // borderRadius: BorderRadius.circular(80.0),
                        //     child: Image.asset(
                        //       'assets/images/circleLogo.png',
                        //       height: 125.0,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Center(
                            child: Text('Coming Soon...',
                                style: GoogleFonts.courgette(
                                  textStyle: TextStyle(
                                      color: Constants.deepBlue, fontSize: 48),
                                ))),
                        SizedBox(height: 5),
                        Text(
                            '\nCuddler can send you emails with updates on new animals listed in your location!\n\n How often would you like to receive these emails?',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Constants.deepBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        CheckboxListTile(
                            value: isEmailNever,
                            onChanged: (bool? value) {
                              setState(() => isEmailNever = value!);
                              isEmailNeverChanged(value!);
                            },
                            title: new Text("Never"),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Constants.deepBlue),
                        CheckboxListTile(
                            value: isEmailDaily,
                            onChanged: (bool? value) {
                              setState(() => isEmailDaily = value!);
                              isEmailDailyChanged(value!);
                            },
                            title: new Text("Daily"),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Constants.deepBlue),
                        CheckboxListTile(
                            value: isEmailWeekly,
                            onChanged: (bool? value) {
                              setState(() => isEmailWeekly = value!);
                              isEmailWeeklyChanged(value!);
                            },
                            title: new Text("Weekly"),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Constants.deepBlue),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton.icon(
                          label: const Text(
                            'Update',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: const Icon(Icons.update_sharp),
                          // backgroundColor: Constants.deepBlue,
                          onPressed: () {
                            // selectImage();
                            Navigator.of(context).pop();
                          },

                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Constants.redOrange), // background
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                        ),
                      ]))
            ])));
  }
}
