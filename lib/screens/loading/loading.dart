import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/main-controller.dart';
import 'package:todo/models/set-system-overlay-style.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/constants/types.dart';
import 'package:todo/models/user/user-email.dart';
import 'package:todo/models/user/user-name.dart';
import 'package:todo/screens/loading/animations.dart';
import 'package:todo/screens/loading/components/logo.dart';
import 'package:todo/screens/loading/components/spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LoadingAnimationsController loadingAnimationsController =
      Get.put(LoadingAnimationsController());
  String nextRoute;
  bool isFirstEnter;
  bool _isDark;
  @override
  void initState() {
    super.initState();
    nextRoute = home_route;
    isFirstEnter = false;
    startLoadingAnimations();
    load();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    _isDark
        ? setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.DARK)
        : setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
    return Scaffold(
        backgroundColor: _isDark ? kDarkBackgroundColor : kBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 50, right: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                LoadingLogo(
                  isDark: _isDark,
                ),
                SizedBox(),
                LoadingSpinkit(
                  isDark: _isDark,
                ),
              ],
            )));
  }

  load() async {
    await check();
    pass();
  }

  check() async {
    await checkUserName().then((response) {
      Get.find<MainController>().updateMainStete(
        newFirstEnterStatus: !response,
      );
      setState(() {
        isFirstEnter = !response;
        if (isFirstEnter) {
          nextRoute = welcome_route;
        } else {
          getTasks();
          getUserName().then((response) {
            Get.find<MainController>().updateMainStete(
              newUserName: response,
            );
          });
          getUserEmail();

          nextRoute = home_route;
        }
      });
    });
  }

  pass() async {
    await Future.delayed(loadingAnimationsController.allAnimationTimes);
    Navigator.pushReplacementNamed(context, nextRoute);
  }
}
