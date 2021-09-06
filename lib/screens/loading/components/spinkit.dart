import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/loading/animations.dart';

class LoadingSpinkit extends StatelessWidget {
  bool isDark;
  LoadingSpinkit({this.isDark});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingAnimationsController>(
      builder: (_) {
        return AnimatedOpacity(
          opacity: _.spinkitOpacity,
          duration: Duration(milliseconds: 666),
          child: SpinKitWave(
            color: isDark ? Colors.white : kSecondaryColor,
            size: 30,
          ),
        );
      },
    );
  }
}
