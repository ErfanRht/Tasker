import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/types.dart';

setSystemUIOverlayStyle({@required SystemUIOverlayStyle systemUIOverlayStyle}) {
  if (systemUIOverlayStyle == SystemUIOverlayStyle.DARK) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kDarkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  } else if (systemUIOverlayStyle == SystemUIOverlayStyle.LIGHT) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
  } else if (systemUIOverlayStyle == SystemUIOverlayStyle.BLUE) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kSecondaryColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  } else if (systemUIOverlayStyle == SystemUIOverlayStyle.BLUE_DARK) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kDarkBackgroundColor2,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
  }
}
