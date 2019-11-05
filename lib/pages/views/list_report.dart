import 'package:base_for_flutter/data/api_service.dart';
import 'package:base_for_flutter/data/constants.dart';
import 'package:base_for_flutter/data/session.dart';
import 'package:base_for_flutter/models/m_report.dart';
import 'package:base_for_flutter/pages/items/i_report.dart';
import 'package:base_for_flutter/utils/values/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'create_report.dart';
import 'list_type.dart';
import 'menu_flutter.dart';

class ListReport extends StatefulWidget {
  @override
  _ListReportState createState() => _ListReportState();
}

class _ListReportState extends State<ListReport> {

  ///Untuk search
  var _searchEdit = new TextEditingController();
  String _searchText = "";
  bool isSearch = false;
  List<Data> _searchListItems = new List<Data>();
  List<Data> _searchResult = new List<Data>();
  List<Data> _listItems = new List<Data>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Report'),
          backgroundColor: MyColor.skyBlue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.tab),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MenuFlutter()));
              },
            ),
            IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListType()));
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _showLogout();
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
              children: <Widget>[
                FutureBuilder(
                    /// ini panggil API dengan snapshotnya
                    future: getReport(),
                    builder: (context, snapshot) {
                      ///apabila snapshot error
                      if (snapshot.hasError) {
                        return Container(
                          height: 100,
                          child: Center(child: Text(snapshot.error.toString())),
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 1000,
                                      child: PKCardListSkeleton(isCircularImage: false, isBottomLinesActive: false,)),
                                ],
                              ));
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            if (snapshot.data.length == 0) {
                              return Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text("Data tidak ditemukan"),
                              );
                            } else {
                              _searchListItems = snapshot.data;
                              _listItems = snapshot.data;
                              return Container(
                                  margin: EdgeInsets.only(top: 40),

                                  ///load data dengan search dan data bukan dengan search
                                  child: isSearch
                                      ? _searchListView()
                                      : _listView());
                            }
                          } else {
                            return Container(
                              height: 100,
                              child:
                                  Center(child: Text("Data tidak ditemukan")),
                            );
                          }
                          break;
                        default:
                          return Container();
                      }
                    }),
              ],
            )),
            _searchBox(),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateReport(),

                          ),
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.yellow,
                      ),
                      foregroundColor: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///kalau di android sama kaya onQueryTextChange
  _ListReportState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _searchText = "";
          isSearch = false;
          //Fluttertoast.showToast(msg: "masuk biasa", toastLength: Toast.LENGTH_SHORT);
        });
      } else {
        setState(() {
          isSearch = true;
          _searchText = _searchEdit.text;
          //Fluttertoast.showToast(msg: "masuk search", toastLength: Toast.LENGTH_SHORT);
        });
      }
    });
  }

  Widget _searchListView() {
    _searchResult.clear();
    _searchResult = new List<Data>();
    for (int i = 0; i < _searchListItems.length; i++) {
      var item = _searchListItems[i];
      if (item.vendor.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchResult.add(item);
      }
    }
    //Fluttertoast.showToast(msg: "return searchView", toastLength: Toast.LENGTH_SHORT);
    ///Dimasukan ke Item (Adapter) dengan filter search
    return ItemReport(report: _searchResult);
  }

  Widget _listView() {
    //Fluttertoast.showToast(msg: "return lissView", toastLength: Toast.LENGTH_SHORT);
    ///Dimasukan ke Item (Adapter) tanpa filter search
    return ItemReport(report: _listItems);
  }

  Widget _searchBox() {
    return new Container(
      child: new TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Vendor',
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
            borderRadius: BorderRadius.circular(2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getReport();
  }

  ///Untuk Get Api
  Future<List<Data>> getReport() async {
    final Response responses = await ApiService.getReport(context: context);
    await Future<String>.delayed(const Duration(milliseconds: 300));
    if (responses.statusCode == APIResponseCode.SUCCESS) {
      ReportResponse reportList = ReportResponse.fromJson(responses.data);
      return reportList.dataList;
    } else {
      Fluttertoast.showToast(
          msg: "Kesalahan : " + responses.statusMessage,
          toastLength: Toast.LENGTH_SHORT);
      return null;
    }
  }

  ///Dialog logout
  void _showLogout() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          onWillPop: () async {
            Future.value(false);
            return false; //return a `Future` with false value so this route cant be popped or closed.
          },
          child: AlertDialog(
            title: new Text("Dialog Logout"),
            content:
            new Text("Apakah anda ingin logout?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                  child: new Text("Tidak"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                child: new Text("Logout"),
                onPressed: () {
                  clearSession();
                  Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);
                },
              ),
            ],
          ) ??
              false,
        );
      },
    );
  }

  ///Untuk Logout
  void clearSession() async {
    await Session.clear();
  }

  ///kalau add list static ke list//////
/*List GetStudent(){
    return[
      Students(
          id : 1,
          name: "fadil",
          email: "bbmfrd@gmail.com",
          age: 22
      ),Students(
          id : 1,
          name: "fadil",
          email: "bbmfrd@gmail.com",
          age: 23
      ),Students(
          id : 1,
          name: "fadil",
          email: "bbmfrd@gmail.com",
          age: 24
      ),Students(
          id : 1,
          name: "fadil",
          email: "bbmfrd@gmail.com",
          age: 25
      ),Students(
          id : 1,
          name: "fadil",
          email: "bbmfrd@gmail.com",
          age: 26
      ),
    ];
  }*/
}
