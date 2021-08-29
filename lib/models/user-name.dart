import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/controllers/controller.dart';

Future<bool> checkUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userNameStatus = prefs.getString('user-name') != null ? true : false;

  return false;
  // TODO: implement checkUserName
  // return userNameStatus;
}

Future<bool> setUserName() async {
  MainController mainController = Get.put(MainController());
  if (mainController.userName == "" ||
      mainController.userName == null ||
      mainController.userName == " " ||
      mainController.userName == "  " ||
      mainController.userName == "   " ||
      mainController.userName == "    " ||
      mainController.userName == "     ") {
    return false;
  }
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user-name', mainController.userName);
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userName = prefs.getString('user-name');

  return userName;
}
