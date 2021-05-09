import 'package:flutter/material.dart';

class userInfo extends StatefulWidget {
  static const routeName = '/update-user-info';
  @override
  userInfoState createState() => userInfoState();
}

class userInfoState extends State<userInfo> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
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
              Form(key: formKey, child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: []))
            ])));
  }
}
