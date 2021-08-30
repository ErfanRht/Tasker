import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/controller.dart';

class HomeTitleText extends StatefulWidget {
  @override
  _HomeTitleTextState createState() => _HomeTitleTextState();
}

class _HomeTitleTextState extends State<HomeTitleText> {
  MainController mainController = Get.put(MainController());

  double _opacity;
  EdgeInsets _padding;
  Duration _animationDuration;

  @override
  void initState() {
    super.initState();
    _opacity = 0;
    _padding = EdgeInsets.only(top: 20, left: 25);
    _animationDuration = Duration(milliseconds: 750);
    _animationController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: _padding,
      duration: _animationDuration,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: _animationDuration,
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                text: "What's up, ",
                style: GoogleFonts.ubuntu(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                      text: mainController.userName,
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: kSecondaryColor)),
                  TextSpan(text: '!'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _animationController() async {
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _opacity = 1;
      _padding = EdgeInsets.only(top: 10, left: 25);
    });
  }
}
