import 'package:base_for_flutter/data/api_service.dart';
import 'package:base_for_flutter/data/constants.dart';
import 'package:base_for_flutter/models/m_type.dart';
import 'package:base_for_flutter/pages/items/i_type.dart';
import 'package:base_for_flutter/utils/components/pk_skeleton_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListType extends StatefulWidget {
  @override
  _ListTypeState createState() => _ListTypeState();
}

class _ListTypeState extends State<ListType> {
  List<Data> listType = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Type'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: getType(),
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
                      margin: EdgeInsets.only(top: 2),
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
                        margin: EdgeInsets.only(top: 2),
                        child: Text("Data tidak ditemukan"),
                      );
                    } else {
                      return Container(
                          margin: EdgeInsets.only(top: 4),

                          ///load data dengan search dan data bukan dengan search
                          child: ItemType(type: snapshot.data));
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
            },
          ),
        ) ,
      ),
    );
  }

  Future<List<Data>> getType() async {
    showToast("sedang get");
    final Response responses = await ApiService.getType(context: context);
    await Future<String>.delayed(const Duration(milliseconds: 300));
    if (responses.statusCode == APIResponseCode.SUCCESS) {
      TypeResponse reportList = TypeResponse.fromJson(responses.data);
      listType = reportList.dataList;
      //showToast(listType.length.toString());
      return listType;
    } else {
      showToast("Kesalahan : " + responses.statusMessage);
      return null;
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }
}
