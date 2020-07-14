import 'package:electronica/firebase%20stuffs/authController.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Animation/FadeAnimation.dart';
import '../Pages/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static String get routeName => '@routes/welcome-page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController _scaleController;

  bool hide = false;

  void _signInWithGoogle(BuildContext context) async {
    try {
      final authBase = Provider.of<AuthBase>(context, listen: false);
      await authBase.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        // _signInErrors(context, e);
      }
    }
  }

  // void _signInErrors(
  //     BuildContext context, PlatformException platformException) {
  //   PlatformExceptionAlert(
  //       title: 'Sign In Failed !', platformException: platformException);
  // }

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/ss003.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Text(
                            "Brand New Arena",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NoeMedium'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.3,
                            Text(
                              "Let's start with our Electronica Collection 2020.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    )),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.7,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () => _signInWithGoogle(context),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    FadeAnimation(
                      1.7,
                      Container(
                        child: Text("Terms & Conditions",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0)),
                      ),
                    ),
                    // FadeAnimation(
                    //   1.7,
                    //   Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.white),
                    //         borderRadius: BorderRadius.circular(50)),
                    //     child: Center(
                    //       child: Text(
                    //         "Create Account",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
