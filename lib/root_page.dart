import 'package:electronica/Pages/home_page.dart';
import 'package:electronica/Pages/welcome.dart';

import './firebase%20stuffs/authController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBase = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder(
      stream: authBase.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User currentUser = snapshot.data;
          if (currentUser != null) {
            return HomePage();
          } else {
            return WelcomePage();
          }
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
