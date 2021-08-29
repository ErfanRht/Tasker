import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/welcome/button.dart';
import 'package:todo/screens/welcome/name.dart';
import 'package:todo/screens/welcome/text.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            SizedBox(),
            Center(child: WelcomeText()),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            Center(
              child: WelcomeName(),
            ),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            LoadingButton(),
            SizedBox(),
            SizedBox(),
          ],
        ));
  }
}
