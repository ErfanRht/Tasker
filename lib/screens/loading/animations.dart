import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingAnimationsController extends GetxController {
  double logoOpacity = 0, textOpacity = 0, spinkitOpacity = 0;
  EdgeInsets logoTextpadding = EdgeInsets.only(top: 33);
  Duration animationSpeed = Duration(milliseconds: 666);
  Duration allAnimationTimes = Duration(milliseconds: 4000);

  updateLoadingAnimations(
      {double newLogoOpacity,
      double newTextOpacity,
      double newSpinkitOpacity,
      EdgeInsets newLogoTextPadding}) {
    logoOpacity = newLogoOpacity != null ? newLogoOpacity : logoOpacity;
    textOpacity = newTextOpacity != null ? newTextOpacity : textOpacity;
    spinkitOpacity =
        newSpinkitOpacity != null ? newSpinkitOpacity : spinkitOpacity;
    logoTextpadding =
        newLogoTextPadding != null ? newLogoTextPadding : logoTextpadding;

    update();
  }
}

startLoadingAnimations() async {
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<LoadingAnimationsController>().updateLoadingAnimations(
      newLogoOpacity: 1, newLogoTextPadding: EdgeInsets.zero);
  await Future.delayed(Duration(milliseconds: 1000));
  Get.find<LoadingAnimationsController>()
      .updateLoadingAnimations(newTextOpacity: 1);
  await Future.delayed(Duration(milliseconds: 250));
  Get.find<LoadingAnimationsController>()
      .updateLoadingAnimations(newSpinkitOpacity: 1);
  await Future.delayed(Duration(milliseconds: 2000));
  Get.find<LoadingAnimationsController>().updateLoadingAnimations(
      newLogoOpacity: 0,
      newTextOpacity: 0,
      newSpinkitOpacity: 0,
      newLogoTextPadding: EdgeInsets.only(top: 33));
}
