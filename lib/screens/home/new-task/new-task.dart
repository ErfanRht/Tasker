import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/home/new-task/animations.dart';
import 'package:todo/screens/home/new-task/components/button.dart';
import 'package:todo/screens/home/new-task/components/close.dart';
import 'package:todo/screens/home/new-task/controller.dart';
import 'package:todo/screens/home/new-task/components/setup.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskController newTaskController = Get.put(NewTaskController());
  NewTaskAnimationsController newTaskAnimationsController = Get.put(
    NewTaskAnimationsController(),
  );
  @override
  Widget build(BuildContext context) {
    startAnimations();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [NewTaskCloseButton(), NewTaskSetup(), NewTaskButton()],
        ),
      ),
    );
  }
}
