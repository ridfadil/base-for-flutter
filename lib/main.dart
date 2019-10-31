import 'package:base_for_flutter/pages/views/list_report.dart';
import 'package:base_for_flutter/pages/views/splashscreen.dart';
import 'package:flutter/material.dart';

import 'auth/login.dart';
import 'utils/values/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BASE FLUTTER 2",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: MyColor.blue,
          bottomAppBarColor: MyColor.blue,
          accentColor: Colors.deepPurple,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      routes: {
        ///Bisa untuk routes pakai name

        '/login': (context) => Login(),
        '/dashboard': (context) => ListReport(),
      },
    );
  }
}
