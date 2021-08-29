import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff0E1F55);
const kSecondaryColor = Color(0xff2BBDEE);
const kBackgroundColor = Color(0xffF9FAFF);

class PrimaryColor extends MaterialStateColor {
  const PrimaryColor() : super(_defaultColor);

  static const int _defaultColor = 0xff0E1F55;
  static const int _pressedColor = 0xff0E1F55;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}
