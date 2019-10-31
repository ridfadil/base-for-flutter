import 'dart:async';
import 'dart:io';
import 'package:base_for_flutter/data/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 3;
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future navigationPage() async {
    PermissionStatus permission, permission2;

    if (Platform.isIOS) {
      ///permisi di ios
      permission = PermissionStatus.granted;
    } else {
      ///permisi untuk android
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions(
          [PermissionGroup.storage, PermissionGroup.location]);
      permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      permission2 = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location);
    }
    print("PERMISSION" + permission.toString());
    if (permission != PermissionStatus.granted ||
        permission2 != PermissionStatus.granted) {
      if (count <= 0) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
      _tryPermission();
    } else {
      bool isLoggedIn = await isSession();
      if (this.mounted) {
        if (isLoggedIn != null && isLoggedIn) {
          setState(() {
            Navigator.pushReplacementNamed(context, '/dashboard');
          });
        } else {
          setState(() {
            Navigator.pushReplacementNamed(context, '/login');
          });
        }
      }
    }
  }

  ///try permission jika di tolak
  void _tryPermission() {
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
            title: new Text("Peringatan!!"),
            content:
            new Text("Aplikasi ini membutuhkan Permission, Silakan Allow untuk melanjutkan."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                  child: new Text("Coba lagi(" + count.toString() + "X)"),
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                    Navigator.pop(context);
                    navigationPage();
                  }),
              new FlatButton(
                child: new Text("Keluar"),
                onPressed: () {
                  SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          ) ??
              false,
        );
      },
    );
  }

  ///get status login
  Future<bool> isSession() async {
    if (Session.getToken() != null) {
      return await Session.isLoggedIn();
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/pragma-logo.png'),
      ),
    );
  }
}
