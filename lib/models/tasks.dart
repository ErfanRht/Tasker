import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/home/new-task/controller.dart';

Future<bool> addTask() async {
  try {
    NewTaskController newTaskController = Get.put(NewTaskController());
    if (newTaskController.text == "") {
      return false;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> tasks = prefs.getStringList('tasks') ?? [];
      tasks.add("${newTaskController.text}&&--++&&${newTaskController.color}");
      prefs.setStringList('tasks', tasks);
      print(tasks);
      Get.find<NewTaskController>().text = "";
      return true;
    }
  } catch (e) {
    return false;
  }
}
