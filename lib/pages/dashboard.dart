import 'package:flutter/material.dart';
import '../models/constants.dart';
import '../widgets/background.dart';
import '../widgets/landingButton.dart';
import '../widgets/transition_route_observer.dart';


class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<Dashboard>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute>();
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routeObserver.subscribe(
  //       this, ModalRoute.of(context) as PageRoute<dynamic>);
  // }

  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }


  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      toolbarHeight: 100.0,
      //leading: ,
      //actions: <Widget>[
      //  signOutBtn,
      //],
      title: Text(
        'Cuddler',
        style: TextStyle(
          fontFamily: 'Solway',
          fontSize: 32.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: Constants.tealBlue,
      elevation: 0,
      textTheme: theme.accentTextTheme,
      iconTheme: theme.accentIconTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme),
      body: Stack(
        children: [
          Background(),
          LayoutBuilder(builder: layoutLanding),
        ],
      ),
    );
  }

  final String adopt = 'Adopt a Pet';
  final String list = 'List a Pet';
  
  Widget layoutLanding(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 500 ? verticalLanding(context) : horizontalLanding(context);
      
  Widget verticalLanding(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30.0),
          Container(
            width: 80.0,
            child: Image.asset('images/blueHeartLogo.png'),
          ),
          Expanded(
            //flex: 3,
            child: Text(
              'Cuddler',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 38.0,
                color: Constants.deepBlue
              ),
            ),
          ),
          Expanded(
            //flex: 3,
            child: Text(
              'Let\'s get started',
              style: TextStyle(
                fontFamily: 'Courgette',
                fontSize: 38.0,
              ),
            ),
          ),
          Expanded(
            //flex: 2,
            child: Text(
              'Please choose an option',
              style: TextStyle(
                fontFamily: 'Hanuman',
                fontSize: 30.0,
              ),
            ),
          ),
          Expanded(
            child: LandingButton(
              displayText: list,
              page: Placeholder(),
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            child: LandingButton(
              displayText: adopt,
              page: Placeholder(),
            ),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }

   Widget horizontalLanding(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.0,
                  child: Image.asset('images/blueHeartLogo.png'),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Cuddler',
                  style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 38.0,
                    color: Constants.deepBlue
                  ),
                ),
              ],
            ),
            Expanded(
              //flex: 2,
              child: Text(
                'Please choose an option',
                style: TextStyle(
                  fontFamily: 'Hanuman',
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Expanded(
                //flex: 1,
                child: LandingButton(
                  displayText: list,
                  page: Placeholder(),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                //flex: 1,
                child: LandingButton(
                  displayText: adopt,
                  page: Placeholder(),
                ),
              ),
            ],
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}

