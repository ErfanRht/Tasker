import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/task-colors.dart';
import 'package:todo/screens/home/new-task/animations.dart';
import 'package:todo/screens/home/new-task/components/button.dart';
import 'package:todo/screens/home/new-task/components/close.dart';
import 'package:todo/controllers/newtask-controller.dart';
import 'package:todo/screens/home/new-task/components/setup.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskController newTaskController = Get.put(NewTaskController());
  NewTaskAnimationsController newTaskAnimationsController = Get.put(
    NewTaskAnimationsController(),
  );
  @override
  Widget build(BuildContext context) {
    startAnimations();
    return WillPopScope(
      onWillPop: () async {
        return await closePage(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [NewTaskCloseButton(), NewTaskSetup(), NewTaskButton()],
          ),
        ),
      ),
    );
  }

  Future closePage(BuildContext context) async {
    await Get.find<NewTaskController>()
        .updateNewTask(newColor: color1, newColorNum: 0, newText: "");
    await Get.find<NewTaskAnimationsController>().updateAnimations(
        newAddButtonOpacity: 0,
        newBox1Opacity: 0,
        newBox2Opacity: 0,
        newCloseButtonOpacity: 0,
        newTextFieldOpacity: 0);
    Navigator.pop(context);
    return null;
  }
}
