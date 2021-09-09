import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/controllers/new-task/newtask-controller.dart';

Future<bool> getTasks() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List tasks = prefs.getStringList('tasks') ?? [];
    tasks = tasks.map((e) => e.split("&&--++&&")).toList();
    Get.find<MainController>().updateMainStete(newTasks: tasks);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> addTask({@required String text, @required int colorNum}) async {
  try {
    print(text);
    if (text == "") {
      return false;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> tasks = prefs.getStringList('tasks') ?? [];
      tasks.add("$text&&--++&&$colorNum&&--++&&not-done");
      prefs.setStringList('tasks', tasks);
      getTasks();
      return true;
    }
  } catch (e) {
    return false;
  }
}

Future<bool> updateTask({@required int index}) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    if (Get.find<MainController>().tasks[index][2] == "not-done") {
      tasks[index] = tasks[index].replaceFirst("not-done", "done");
    } else {
      tasks[index] = tasks[index].replaceFirst("done", "not-done");
    }
    prefs.setStringList('tasks', tasks);
    getTasks();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeTask({@required int index}) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    tasks.removeAt(index);
    prefs.setStringList('tasks', tasks);
    getTasks();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeAllTasks() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('tasks');
    getTasks();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> doneAllTasks() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    tasks = tasks.map((e) => e.replaceFirst("not-done", "done")).toList();
    prefs.setStringList('tasks', tasks);
    getTasks();
    return true;
  } catch (e) {
    return false;
  }
}
