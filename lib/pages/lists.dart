import 'select_location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/my_flutter_app_icons.dart';
import '../widgets/dogsList.dart';
import '../widgets/catsList.dart';
import '../widgets/othersList.dart';

//List screen Widget
class Lists extends StatefulWidget {
  static const routeName = '/lists_page';

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    final LocationArguments args =
        ModalRoute.of(context)!.settings.arguments as LocationArguments;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(MyFlutterApp.dog)),
              Tab(icon: Icon(MyFlutterApp.cat)),
              Tab(icon: Icon(MyFlutterApp.pastafarianism)),
            ],
          ),
          title: Text('Cuddler'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            DogsList(location: args.location),
            CatsList(location: args.location),
            OthersList(location: args.location),
          ],
        ),
      ),
    );
  }
}
