import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/animations.dart';
import 'package:todo/screens/home/components/tasks/items.dart';

class HomeTasks extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _.tasksTitleOpacity,
                    child: Text(
                      "TODAY'S TASKS",
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            HomeTasksItems()
          ],
        ),
      );
    });
  }
}
