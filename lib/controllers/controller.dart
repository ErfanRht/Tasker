import 'package:get/get.dart';

class MainController extends GetxController {
  bool isFirstEnter = false;
  String userName = "";

  List tasks = [];

  updateMainStete(
      {bool newFirstEnterStatus, String newUserName, List newTasks}) {
    isFirstEnter =
        newFirstEnterStatus != null ? newFirstEnterStatus : isFirstEnter;
    userName = newUserName != null ? newUserName : userName;
    tasks = newTasks != null ? newTasks : tasks;

    update();
  }
}
