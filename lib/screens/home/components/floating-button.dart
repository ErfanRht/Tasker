import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/screens/home/animations.dart';

class HomeFloatingButton extends StatelessWidget {
  Duration _duration = Duration(milliseconds: 500);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
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
              size: _isDark ? 33 : 30,
              color: _isDark ? kDarkPrimaryColor : Colors.white,
            ),
            backgroundColor: _isDark ? kBackgroundColor : kSecondaryColor,
            highlightElevation: 3,
          ),
        );
      },
    );
  }
}
