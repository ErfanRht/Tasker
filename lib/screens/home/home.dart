import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/types.dart';
import 'package:todo/models/set-system-overlay-style.dart';
import 'package:todo/screens/home/animations.dart';
import 'package:todo/controllers/home-controller.dart';
import 'package:todo/screens/home/components/drawer.dart';
import 'package:todo/screens/home/components/floating-button.dart';
import 'package:todo/screens/home/components/navbar.dart';
import 'package:todo/screens/home/components/tasks/tasks.dart';
import 'package:todo/screens/home/components/title-text.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());
  int num = 0;
  @override
  Widget build(BuildContext context) {
    homeController.advancedDrawerController.addListener(() {
      Get.find<HomeController>().changeDrawerStatus();
      if (Get.find<HomeController>().drawerStatus == DrawerStatus.OPEN) {
        setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.BLUE);
      } else if (Get.find<HomeController>().drawerStatus ==
          DrawerStatus.CLOSE) {
        setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
      }
    });
    startHomeAnimations();
    return GetBuilder<HomeController>(
      builder: (_) {
        return AdvancedDrawer(
          backdropColor: kSecondaryColor,
          controller: homeController.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          openRatio: 0.66,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          drawer: HomeDrawer(),
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [HomeNavbar(), HomeTitleText(), HomeTasks()],
              ),
            )),
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 25),
                child: HomeFloatingButton()),
          ),
        );
      },
    );
  }
}
