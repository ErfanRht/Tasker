import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/types.dart';
import 'package:todo/models/set-system-overlay-style.dart';
import 'package:todo/screens/new-task/animations.dart';

class NewTaskCloseButton extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<NewTaskAnimationsController>(builder: (_) {
      return AnimatedOpacity(
        opacity: _.closeButtonOpacity,
        duration: _animationDuration,
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: GestureDetector(
                  child: Icon(FontAwesomeIcons.timesCircle,
                      size: 50,
                      color: _isDark
                          ? kBackgroundColor
                          : kSecondaryColor.withOpacity(0.75)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
