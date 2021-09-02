import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/screens/home/animations.dart';

class HomeFloatingButton extends StatelessWidget {
  Duration _duration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAnimationsController>(
      builder: (_) {
        return AnimatedOpacity(
          opacity: _.floatingButtonOpacity,
          duration: _duration,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, newtask_route);
            },
            child: Icon(
              Icons.add_rounded,
              size: 30,
            ),
            backgroundColor: kSecondaryColor,
            highlightElevation: 3,
          ),
        );
      },
    );
  }
}
