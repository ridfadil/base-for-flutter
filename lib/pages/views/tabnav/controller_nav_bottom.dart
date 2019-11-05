import 'package:flutter/material.dart';
import 'package:base_for_flutter/pages/views/tabnav/tab_1.dart';
import 'package:base_for_flutter/pages/views/tabnav/tab_2.dart';
import 'package:base_for_flutter/pages/views/tabnav/tab_3.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    TabOne(),
    TabTwo(),
    Tabthree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom example'),
        backgroundColor: Colors.blueAccent,
        //END CODE
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text('Satu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_compact),
            title: Text('Dua'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Tiga'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
