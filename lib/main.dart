import 'package:base_for_flutter/pages/views/report_list.dart';
import 'package:base_for_flutter/pages/views/splashscreen.dart';
import 'package:flutter/material.dart';

import 'auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BASE FLUTTER 2",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.blueAccent,
      ),
      home: SplashScreen(),
      routes: {
        'login': (context) => Login(),
        'dashboard': (context) => StudentActivity(),
      },
    );
  }
}
