import 'package:base_for_flutter/data/api_service.dart';
import 'package:base_for_flutter/data/constants.dart';
import 'package:base_for_flutter/data/session.dart';
import 'package:base_for_flutter/models/m_token.dart';
import 'package:base_for_flutter/pages/views/report_list.dart';
import 'package:base_for_flutter/utils/components/dialog.dart';
import 'package:base_for_flutter/utils/values/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = new TextEditingController();
  final _password = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _email.text = "apps.user";
    _password.text = "12345";
  }

  //Setiap Controller harus Dispose
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _validate() {
    if (_email.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Email tidak boleh kosong", toastLength: Toast.LENGTH_SHORT);
    } else if (_password.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password tidak boleh kosong", toastLength: Toast.LENGTH_SHORT);
    } else {
      _doLogin();
    }
  }

  Future _doLogin() async {
    MyDialog.loading(context);
    Response response = await ApiService.login(
        context: context, email: _email.text, password: _password.text);
    MyDialog.dismiss(context);
    return new Future.delayed(new Duration(milliseconds: 0), () {
      if (response.statusCode == APIResponseCode.SUCCESS) {
        var res = new Map<String, dynamic>.from(response.data);
        print(res);
        TokenResponse token = TokenResponse.fromJson(res);
        _setSession(token);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StudentActivity()));
      } else {
        Fluttertoast.showToast(
            msg: response.statusCode.toString() + " - " + response.toString(),
            toastLength: Toast.LENGTH_SHORT);
        return null;
      }
    });
  }

  void _setSession(TokenResponse token) {
    Session.setToken(token.accessToken);
    Session.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        backgroundColor: Color(0xFFFBF8F8),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            color: Color(0xFFFBF8F8),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                  child: Container(
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child:
                                  Image.asset('assets/images/pragma-logo.png')),
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: TextField(
                    autofocus: false,
                    //obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                        hintText: 'USERNAME'),
                    controller: _email,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.grey),
                        hintText: 'Password'),
                    controller: _password,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: ButtonTheme(
                    padding: EdgeInsets.only(left: 39.0, right: 29.0),
                    minWidth: 345.0,
                    height: 53.0,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: MyColor.skyBlue,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onPressed: () {
                          _validate();
                          //Navigator.pushReplacementNamed(context, '/home');
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
