import 'package:electronica/constants/product_list.dart';
import 'package:electronica/screen_widgets/home_screen/home_screen_home.dart';

import '../Animation/FadeAnimation.dart';
import '../Pages/upi_testing.dart';

import '../widget/categories.dart';
import '../widget/main_image.dart';
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
            dashBoard(),
            HomeScreenHome(),
          ],
        ),
      )),
    );
  }

  Widget dashBoard() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF090909),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.55,
              color: Color(0xFF090909),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 36,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 35,
                            child: Text(
                              'R',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NoeMedium',
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                        SizedBox(height: 130),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('My Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.insert_drive_file,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('My Orders',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Notifications',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Settings',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.help_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Help',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Sign Out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'NoeMedium',
                                      letterSpacing: 1.2))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
