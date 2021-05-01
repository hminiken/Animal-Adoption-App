import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'dashboard.dart';
import '../models/constants.dart';
import '../models/users.dart';
import '../widgets/background.dart';
import '../widgets/custom_route.dart';

//https://github.com/NearHuscarl/flutter_login/tree/master/example
class Login extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  //Future<String?> _loginUser(LoginData data) {
  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'Username does not exist';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  //Future<String?> _recoverPassword(String name) {
  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'Username does not exist';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: loginLayout),
    );
  }

  Widget loginLayout(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500
          ? verticalLogin(context)
          : horizontalLogin(context);

  Widget verticalLogin(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: 'images/circleLogo.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      theme: LoginTheme(
        primaryColor: Constants.tealBlue,
        accentColor: Constants.fadedOrange,
        errorColor: Constants.fadedYellow,
        pageColorLight: Constants.redOrange,
        pageColorDark: Constants.tealBlue,
        titleStyle: TextStyle(
          color: Constants.deepBlue,
          fontFamily: 'DMSerifDisplay',
          letterSpacing: 2,
        ),
      ),
      messages: LoginMessages(
        usernameHint: 'Email',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot your password?',
        recoverPasswordButton: 'RECOVER',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'No match!',
        recoverPasswordIntro: 'Enter your email',
        recoverPasswordDescription:
            'We will send you a link to recover your password',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
      emailValidator: (value) {
        // if (!value!.contains('@') || !value.endsWith('.com')) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        //if (value!.isEmpty) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => Dashboard(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
      },
      //change to true when debugging 
      showDebugButtons: false,
    );
  }

  Widget horizontalLogin(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: _textBox(
                  'Welcome to Cuddler', 'Courgette', 38.0, TextAlign.center),
            ),
            Expanded(
              flex: 1,
              child: _textBox('Please turn your screen in order to log in',
                  'Solway', 30.0, TextAlign.center),
            ),
            Expanded(
              flex: 1,
              child: _textBox(
                  'After signing in, you can enjoy all screen orientations',
                  'Solway',
                  30.0,
                  TextAlign.center),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textBox(
    final String text,
    final String fontFam,
    final double fSize,
    TextAlign spacing,
  ) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            text,
            style: TextStyle(
              fontFamily: fontFam,
              fontSize: fSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.black,
            ),
            textAlign: spacing,
          ),
          // Solid text as fill.
          Text(
            text,
            style: TextStyle(
              fontFamily: fontFam,
              fontSize: fSize,
              color: Colors.white,
            ),
            textAlign: spacing,
          ),
        ],
      ),
    );
  }
}
