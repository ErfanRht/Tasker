import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/controller.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            drawerItem("Add new task", FontAwesomeIcons.plusCircle, () {
              // Navigator.pushNamed(context, newtask_route);
            }),
            drawerItem(
                "Delete all tasks", FontAwesomeIcons.solidTrashAlt, () {}),
            drawerItem("Tasks history", FontAwesomeIcons.clipboardList, () {}),
            drawerItem("Settings", FontAwesomeIcons.cog, () {}),
            drawerItem("Support", FontAwesomeIcons.handHoldingHeart, () {}),
            drawerItem("Exit", FontAwesomeIcons.signOutAlt, () {}),
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
}
