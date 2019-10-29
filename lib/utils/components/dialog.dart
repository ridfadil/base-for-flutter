import 'package:flutter/material.dart';

class MyDialog {
  static bool isDismissVal = false;

  static void loading(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 50));
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new Dialog(
            child: Container(
              padding: EdgeInsets.all(4),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    child: new CircularProgressIndicator(),
                  ),
                  new Text("Loading"),
                ],
              ),
            ),
          ),
    ).then((val) {
      isDismissVal = true;
    });
  }

  static dismiss(context) async {
    Navigator.of(context).pop(); //pop dialog
  }

  static isDismiss() {
    return isDismissVal;
  }
}
