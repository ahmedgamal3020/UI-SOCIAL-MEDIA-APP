import 'package:demo/logInOrSignUPAccount/addPhoto.dart';
import 'package:demo/screens/chats.dart';
import 'package:demo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fristScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:fristScreen(),

    );

  }
}
