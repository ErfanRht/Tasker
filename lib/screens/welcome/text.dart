import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';

class WelcomeText extends StatefulWidget {
  @override
  _WelcomeTextState createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> {
  Duration _animationSpeed;
  double _opacity;
  EdgeInsets _padding;

  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
    _animationSpeed = Duration(milliseconds: 666);
    _padding = EdgeInsets.only(top: 33);

    animationController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _animationSpeed,
      child: AnimatedPadding(
          duration: _animationSpeed,
          padding: _padding,
          child: Text("Welcome",
              style: GoogleFonts.oswald(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 66))),
    );
  }

  animationController() async {
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {
      _opacity = 1.0;
      _padding = EdgeInsets.zero;
    });
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      _opacity = 0.0;
      _padding = EdgeInsets.only(top: 33);
    });
  }
}
