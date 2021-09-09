import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/controllers/main-controller.dart';

Future<bool> checkUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userNameStatus = prefs.getString('user-name') != null ? true : false;

  // return false; // just for debuging
  return userNameStatus;
}

Future<bool> setUserName({@required String userName}) async {
  if (userName == null ||
      userName == "" ||
      userName == " " ||
      userName == "  " ||
      userName == "   ") {
    return false;
  }
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user-name', userName);
    getUserName();
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userName = prefs.getString('user-name');
  Get.find<MainController>().updateMainStete(newUserName: userName);

  return userName;
}
