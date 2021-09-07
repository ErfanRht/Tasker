import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/controller.dart';
import 'package:todo/controllers/home-controller.dart';
import 'package:todo/models/tasks.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
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
                  padding: EdgeInsets.only(left: 40, bottom: 40),
                  child: Text(Get.find<MainController>().userName,
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                      )),
                ),
              ],
            ),
            drawerItem("Add new task", FontAwesomeIcons.plusCircle, () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, newtask_route);
            }),
            drawerItem("Done all tasks", FontAwesomeIcons.checkDouble,
                () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 450));
              doneAllTasks();
            }),
            drawerItem("Delete all tasks", FontAwesomeIcons.solidTrashAlt,
                () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              showDialog(
                context: context,
                builder: (context) {
                  return removeAllTasksDialog(context);
                },
              );
            }),
            drawerItem("Settings", FontAwesomeIcons.cog, () {}),
            drawerItem("Support", FontAwesomeIcons.handHoldingHeart, () {
              _launchInBrowser('https://github.com/ErfanRht/');
            }),
            drawerItem("Exit", FontAwesomeIcons.signOutAlt, () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              SystemNavigator.pop();
            }),
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
  }

  Widget drawerItem(String title, IconData icon, Function onTap) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.only(top: 12.5, bottom: 12.5, left: 40),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(0.925),
                size: 17.5,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  color: Colors.white.withOpacity(0.925),
                  fontWeight: FontWeight.w600,
                  fontSize: 17.5,
                ),
              ),
            ],
          )),
    );
  }

  Widget removeAllTasksDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: _isDark ? kDarkBackgroundColor2 : kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        "Are you sure?",
        style: GoogleFonts.ubuntu(
            fontSize: 22.5,
            fontWeight: FontWeight.w600,
            color: _isDark ? kBackgroundColor : kDarkBackgroundColor),
      ),
      content: Text(
        "All tasks will be deleted.",
        style: GoogleFonts.ubuntu(
            fontSize: 17.5,
            fontWeight: FontWeight.w500,
            color: _isDark
                ? kBackgroundColor.withOpacity(0.8)
                : kDarkBackgroundColor.withOpacity(0.8)),
      ),
      actions: [
        FlatButton(
          child: Text(
            "Cancel",
            style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isDark
                    ? kBackgroundColor.withOpacity(0.9)
                    : kDarkBackgroundColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            "Delete",
            style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.redAccent),
          ),
          onPressed: () {
            removeAllTasks();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future<void> _launchInBrowser(String url) async {
    try {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
