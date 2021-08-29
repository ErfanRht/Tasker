import 'package:get/get.dart';

class MainController extends GetxController {
  bool isFirstEnter = false;

  String userName = "";

  updateMainStete({bool newFirstEnterStatus, String newUserName}) {
    isFirstEnter =
        newFirstEnterStatus != null ? newFirstEnterStatus : isFirstEnter;
    userName = newUserName != null ? newUserName : userName;

    print(isFirstEnter);
    update();
  }
}
