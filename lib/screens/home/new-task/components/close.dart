import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/home/new-task/animations.dart';

class NewTaskCloseButton extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
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
                      size: 50, color: kSecondaryColor.withOpacity(0.75)),
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
