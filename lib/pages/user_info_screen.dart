import 'package:flutter/material.dart';
import '../models/constants.dart';

class UserInfo extends StatefulWidget {
  static const routeName = '/update-user-info';
  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  String currentVal = "Alabama";

  Widget build(BuildContext context) {
    TextEditingController displayNameController = new TextEditingController();
    displayNameController.text = "My Name";

    TextEditingController emailController = new TextEditingController();
    emailController.text = "My Email";

    TextEditingController phoneController = new TextEditingController();
    phoneController.text = "My Phone";

    return Scaffold(
        appBar: AppBar(
          title: Text('Update Information'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(height: 10),
              Form(
                  key: formKey,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text(
                          "My Information: ",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 25),
                        ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Display Name: "),
                            subtitle: TextField(
                              controller: displayNameController,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email: "),
                            subtitle: TextField(
                              controller: emailController,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                            leading: Icon(Icons.phone_android),
                            title: Text("Phone #: "),
                            subtitle: TextField(
                              controller: phoneController,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Location: "),
                            subtitle: DropdownButtonFormField(
                              items:
                                  Constants().statesList.map((String category) {
                                return new DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        // Icon(Icons.star),
                                        Text(category),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  currentVal = newValue!;
                                });
                              },
                              value: currentVal,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 10, 20),
                                // filled: true,
                                // fillColor: Colors.grey[200],
                                //  hintText: Localization.of(context).category,
                                //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton.icon(
                          label: const Text(
                            'Update',
                            style: TextStyle(fontSize: 20),
                          ),
                          icon: const Icon(Icons.update_sharp),
                          // backgroundColor: colDarkBlue,
                          onPressed: () {
                            // selectImage();
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
