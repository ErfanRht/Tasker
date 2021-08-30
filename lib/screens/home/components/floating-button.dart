import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';

class HomeFloatingButton extends StatefulWidget {
  @override
  _HomeFloatingButtonState createState() => _HomeFloatingButtonState();
}

class _HomeFloatingButtonState extends State<HomeFloatingButton> {
  double _opacity;
  Duration _duration;
  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
    _duration = Duration(milliseconds: 500);
    _animationController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _duration,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, newtask_route);
        },
        child: Icon(
          Icons.add_rounded,
          size: 30,
        ),
        backgroundColor: kSecondaryColor,
        highlightElevation: 3,
      ),
    );
  }

  _animationController() async {
    await Future.delayed(Duration(milliseconds: 3500));
    setState(() {
      _opacity = 1.0;
    });
  }
}
