import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/types.dart';
import 'package:todo/models/set-system-overlay-style.dart';
import 'package:todo/screens/welcome/components/button.dart';
import 'package:todo/screens/welcome/components/name.dart';
import 'package:todo/screens/welcome/components/text.dart';

class WelcomeScreen extends StatelessWidget {
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    _isDark
        ? setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.DARK)
        : setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
    return Scaffold(
        backgroundColor: _isDark ? kDarkBackgroundColor : kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            SizedBox(),
            Center(child: WelcomeText(isDark: _isDark)),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            Center(
              child: WelcomeName(isDark: _isDark),
            ),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            LoadingButton(isDark: _isDark),
            SizedBox(),
            SizedBox(),
          ],
        ));
  }
}
