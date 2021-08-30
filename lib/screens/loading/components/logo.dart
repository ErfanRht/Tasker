import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';

class LoadingLogo extends StatefulWidget {
  @override
  _LoadingLogoState createState() => _LoadingLogoState();
}

class _LoadingLogoState extends State<LoadingLogo> {
  Duration _animationSpeed;
  double _logoOpacity, _textOpacity;
  EdgeInsets _padding;

  @override
  void initState() {
    super.initState();
    _logoOpacity = 0.0;
    _textOpacity = 0.0;
    _animationSpeed = Duration(milliseconds: 666);
    _padding = EdgeInsets.only(top: 33);

    animationController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _logoOpacity,
          duration: _animationSpeed,
          child: AnimatedPadding(
            duration: _animationSpeed,
            padding: _padding,
            child: Icon(Icons.check_circle_outline_rounded,
                color: kSecondaryColor,
                size: MediaQuery.of(context).size.width * 0.75),
          ),
        ),
        AnimatedOpacity(
          opacity: _textOpacity,
          duration: _animationSpeed,
          child: Text(
            "ToDo app",
            style: GoogleFonts.ubuntu(
                color: kSecondaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30),
          ),
        )
      ],
    );
  }

  animationController() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _logoOpacity = 1.0;
      _padding = EdgeInsets.zero;
    });
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _textOpacity = 1.0;
    });
    await Future.delayed(Duration(milliseconds: 4000));
    setState(() {
      _logoOpacity = 0.0;
      _textOpacity = 0.0;
      _padding = EdgeInsets.only(top: 33);
    });
  }
}
