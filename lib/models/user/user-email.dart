import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/controllers/main-controller.dart';

Future<bool> checkUserEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userNameStatus = prefs.getString('user-email') != null ? true : false;

  return userNameStatus;
}

Future<bool> setUserEmail({@required String userEmail}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  EmailValidation(email: userEmail).then((response) {
    if (response) {
      prefs.setString('user-email', userEmail);
      getUserEmail();
      return true;
    } else {
      return false;
    }
  });
}

Future<String> getUserEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userEmail = prefs.getString('user-email');
  Get.find<MainController>().updateMainStete(newUserEmail: userEmail);

  return userEmail;
}

// ignore: non_constant_identifier_names
Future<bool> EmailValidation({@required String email}) async {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(email))
    return false;
  else
    return true;
}
