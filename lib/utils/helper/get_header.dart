/*
import 'package:schoolconnect/utils/helper/shared_preferences.dart';

Future getHeadersAPI() async {
  Map<String, String> header = {};
  header.clear();
  header["Cache-Control"] = "no-cache";
  header["app"] = await SharedPref.getAppId();
  header["token"] = await SharedPref.getToken();
  header["role"] = await SharedPref.getRole();
  print("HEADERSS: " + header.toString());
  return header;
}

Future getRoleUser() async {
  return await SharedPref.getRole();
}
*/
