import 'package:base_for_flutter/pages/views/navigation/controller_nav_bottom.dart';
import 'package:base_for_flutter/pages/views/navigation/controller_nav_tab.dart';
import 'package:base_for_flutter/pages/views/navigation/controller_navigation_menu.dart';
import 'package:base_for_flutter/utils/values/colors.dart';
import 'package:flutter/material.dart';

class MenuFlutter extends StatefulWidget {
  @override
  _MenuFlutterState createState() => _MenuFlutterState();
}

class _MenuFlutterState extends State<MenuFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example layout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150,
                      color: Colors.blueAccent,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Tab Nav',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ExampleTab()));
              },
            ),
            InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150,
                      color: MyColor.blue,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Bottom Nav',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BottomNav()));
              },
            ),
            InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150,
                      color: Colors.lightBlue,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Nav Menu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavigationMenu()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
