import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/home/home-controller.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/screens/home/components/drawer/items/item.dart';
import 'package:todo/screens/home/components/drawer/items/edit-profile.dart';
import 'package:todo/screens/home/components/drawer/items/remove-all-tasks.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeDrawerItem(
            title: "Add new task",
            icon: FontAwesomeIcons.plusCircle,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, newtask_route);
            }),
        HomeDrawerItem(
            title: "Done all tasks",
            icon: FontAwesomeIcons.checkDouble,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 450));
              doneAllTasks();
            }),
        HomeDrawerItem(
            title: "Delete all tasks",
            icon: FontAwesomeIcons.solidTrashAlt,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              showDialog(
                context: context,
                builder: (context) {
                  return RemoveAllTasksDialog();
                },
              );
            }),
        HomeDrawerItem(
            title: "Edit profile",
            icon: FontAwesomeIcons.cog,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              showDialog(
                context: context,
                builder: (context) {
                  return EditProfileDialog();
                },
              );
            }),
        HomeDrawerItem(
            title: "Support",
            icon: FontAwesomeIcons.handHoldingHeart,
            onTap: () {
              _launchInBrowser('https://github.com/ErfanRht/');
            }),
        HomeDrawerItem(
            title: "Exit",
            icon: FontAwesomeIcons.signOutAlt,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              SystemNavigator.pop();
            }),
      ],
    );
  }

  DrawerItem(String s, IconData checkDouble, Future<Null> Function() param2) {}
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
