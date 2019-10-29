import 'dart:async';
import 'package:base_for_flutter/models/m_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class Session {
///////////////////////    SETUP   /////////////////////////////////////////////
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

///////////////////////    APP_ID  /////////////////////////////////////////////
  static Future<String> getAppId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.APP_ID);
  }

  static Future<void> setAppID(String appId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.APP_ID, appId);
  }

///////////////////////    TOKEN   /////////////////////////////////////////////
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.TOKEN);
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.TOKEN, token);
  }

  ///////////////////////    ROLE   /////////////////////////////////////////////
  static Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.ROLE);
  }

  static Future<void> setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.ROLE, role);
  }

///////////////////////    LOGIN   /////////////////////////////////////////////
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.IS_USER_LOGGED_IN);
  }

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPrefKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

  ///////////////////////    USER   /////////////////////////////////////////////
  static Future<Map<String, String>> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = {
      'app': prefs.getString(SharedPrefKeys.APP_ID),
      'token': prefs.getString(SharedPrefKeys.TOKEN),
      'role': prefs.getString(SharedPrefKeys.ROLE),
    };
    return user;
  }

  ///////////////////////    PROFILE   /////////////////////////////////////////////
  static Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.NAME, name);
  }

  static Future<void> setStudentId(int studentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(SharedPrefKeys.USER_ID, studentId);
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.USER_ID);
  }

  static Future<void> setFirebaseToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.FIREBASE_TOKEN, token);
  }

  static Future<Profile> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Profile user = new Profile();
    user.id = prefs.getInt(SharedPrefKeys.USER_ID);
    user.name = prefs.getString(SharedPrefKeys.NAME);
    return user;
  }
}
