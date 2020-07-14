import 'package:electronica/firebase%20stuffs/authController.dart';
import 'package:electronica/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User user;
  @override
  void initState() {
    super.initState();
    final authBase = Provider.of<AuthBase>(context, listen: false);
    authBase.currentUser().then((value) => setState(() {
          user = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xFF090909),
        color: Color(0xFF121212),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.55,
              //  color: Color(0xFF090909),
              color: Color(0xFF121212),
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
                            child: user.photoURL == null
                                ? Text(
                                    'R',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NoeMedium',
                                        letterSpacing: 1.2),
                                  )
                                : Container(),
                            backgroundImage: NetworkImage(user.photoURL ?? ' '),
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
