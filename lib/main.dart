import 'package:electronica/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase stuffs/authController.dart';
import 'firebase stuffs/fireStore_Controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (_) => Auth(),
        ),
        Provider<CloudBase>(
          create: (_) => Cloud(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootPage(),
      ),
    );
  }
}
