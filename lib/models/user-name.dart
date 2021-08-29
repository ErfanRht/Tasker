import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userNameStatus = prefs.getString('user-name') != null ? true : false;

  return userNameStatus;
}

Future<bool> setUserName(String userName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user-name', userName);

  return true;
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userName = prefs.getString('user-name');

  return userName;
}
