import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/screens/home/animations.dart';

class HomeTitleText extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  Duration _animationDuration = Duration(milliseconds: 750);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return AnimatedPadding(
        padding: _.titlePadding,
        duration: _animationDuration,
        child: AnimatedOpacity(
          opacity: _.titleOpacity,
          duration: _animationDuration,
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "What's up, ",
                  style: GoogleFonts.ubuntu(
                    fontSize: 35,
                    color: _isDark ? kBackgroundColor : Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                        text: mainController.userName,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                            color:
                                _isDark ? kBackgroundColor : kSecondaryColor)),
                    TextSpan(text: '!'),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
