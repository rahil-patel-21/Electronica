import '../screen_widgets/dashboard.dart';
import '../screen_widgets/home_screen/home_screen_home.dart';
import '../Pages/upi_testing.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String get routeName => '@routes/home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = false;
  bool isSearching = false;
  TextEditingController searchController;
  String searchedString = " ";

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void goToPayment() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          isSearching = false;
          isCollapsed = false;
        });
      },
      child: Scaffold(
          body: Container(
        child: Stack(
          children: <Widget>[
            Dashboard(),
            HomeScreenHome(),
          ],
        ),
      )),
    );
  }
}
