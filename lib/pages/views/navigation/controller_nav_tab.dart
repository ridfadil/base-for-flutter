import 'package:base_for_flutter/pages/views/navigation/tab_1.dart';
import 'package:base_for_flutter/pages/views/navigation/tab_2.dart';
import 'package:base_for_flutter/pages/views/navigation/tab_3.dart';
import 'package:flutter/material.dart';

class ExampleTab extends StatefulWidget {
  @override
  _ExampleTabState createState() => _ExampleTabState();
}

///di extend SingleTickerProviderStateMixin
class _ExampleTabState extends State<ExampleTab> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3); ///LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tab example'),
            backgroundColor: Colors.blueAccent,
            ///CODE untuk icon
            bottom: TabBar(
                controller: controller,
                tabs: <Tab>[
                  Tab(icon: Icon(Icons.home),),
                  Tab(icon: Icon(Icons.note),),
                  Tab(icon: Icon(Icons.poll),),
                ]
            ),
            //END CODE
          ),
          ///CODE untuk isi tab
          body: TabBarView(
              controller: controller,
              children: <Widget>[
                TabOne(),
                TabTwo(),
                Tabthree()
              ]
          ),
          //END CODE
        )
    );
  }
}
