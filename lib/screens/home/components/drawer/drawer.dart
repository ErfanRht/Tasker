import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/screens/home/components/drawer/items/items.dart';

class HomeDrawer extends StatelessWidget {
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<MainController>(builder: (_) {
      return SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25, left: 25),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.55,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(Get.find<MainController>().userName,
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 42.5, bottom: 25),
                    child: Text(_.userEmail != null ? _.userEmail : "",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5,
                        )),
                  ),
                ],
              ),
              DrawerItems()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text("Copyright ©2021 | Erfan Rahmati",
                style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ));
    });
  }
}
