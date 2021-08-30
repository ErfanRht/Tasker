import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';

class LoadingSpinkit extends StatefulWidget {
  @override
  _LoadingSpinkitState createState() => _LoadingSpinkitState();
}

class _LoadingSpinkitState extends State<LoadingSpinkit> {
  double _opacity;
  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
    animatedController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 666),
      child: SpinKitWave(
        color: kSecondaryColor,
        size: 30,
      ),
    );
  }

  animatedController() async {
    await Future.delayed(Duration(milliseconds: 1750));
    setState(() {
      _opacity = 1.0;
    });
    await Future.delayed(Duration(milliseconds: 3250));
    setState(() {
      _opacity = 0.0;
    });
  }
}
