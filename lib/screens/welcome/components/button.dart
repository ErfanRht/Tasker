import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/models/user/user-name.dart';

class LoadingButton extends StatefulWidget {
  bool isDark;
  LoadingButton({this.isDark});
  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isDark;
  Duration _animationSpeed;
  double _opacity;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _setName() async {
    await setUserName(userName: Get.find<MainController>().userName)
        .then((value) {
      if (value) {
        Timer(Duration(seconds: 2), () {
          _btnController.success();
          Timer(Duration(milliseconds: 1500), () {
            Navigator.pushReplacementNamed(context, home_route);
          });
        });
      } else {
        Timer(Duration(seconds: 2), () {
          _btnController.error();
          Timer(Duration(seconds: 2), () {
            _btnController.reset();
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isDark = widget.isDark;
    _opacity = 0.0;
    _animationSpeed = Duration(milliseconds: 500);

    animationController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _animationSpeed,
      child: RoundedLoadingButton(
        child: Text('continue',
            style: GoogleFonts.ubuntu(
                color: isDark ? kDarkBackgroundColor : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        height: 55,
        color: isDark ? kBackgroundColor : kSecondaryColor,
        successColor: Colors.greenAccent,
        errorColor: Colors.redAccent,
        controller: _btnController,
        onPressed: _setName,
        valueColor: isDark ? kDarkBackgroundColor : Colors.white,
      ),
    );
  }

  animationController() async {
    await Future.delayed(Duration(milliseconds: 5555));
    setState(() {
      _opacity = 1.0;
    });
  }
}
