import 'package:flutter/material.dart';
import 'package:todo/models/user/user-email.dart';
import 'package:todo/models/user/user-name.dart';

Future<bool> UpdateUserData({String name, String email, String age}) async {
  if (name != null && name != "") {
    setUserName(userName: name);
  }
  if (email != null && email != "") {
    setUserEmail(userEmail: email);
  }
}
