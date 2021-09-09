import 'package:get/get.dart';

class MainController extends GetxController {
  bool isFirstEnter = false;
  String userName = "";
  String userEmail = "";
  String userAge = "";

  List tasks = [];

  updateMainStete(
      {bool newFirstEnterStatus,
      String newUserName,
      String newUserEmail,
      String newUserAge,
      List newTasks}) {
    isFirstEnter =
        newFirstEnterStatus != null ? newFirstEnterStatus : isFirstEnter;
    userName = newUserName != null ? newUserName : userName;
    userEmail = newUserEmail != null ? newUserEmail : userEmail;
    userAge = newUserAge != null ? newUserAge : userAge;
    tasks = newTasks != null ? newTasks : tasks;

    update();
  }
}
