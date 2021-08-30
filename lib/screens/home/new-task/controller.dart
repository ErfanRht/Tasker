import 'package:get/get.dart';

class NewTaskController extends GetxController {
  String text = "";
  String color = "0xff2BBDEE";

  updateNewTask({String newText, String newColor}) {
    text = newText != null ? newText : text;
    color = newColor != null ? newColor : color;

    update();
  }
}
