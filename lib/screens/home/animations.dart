import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeAnimationsController extends GetxController {
  // navbar:
  double navbarOpacity1 = 0, navbarOpacity2 = 0;
  // title:
  double titleOpacity = 0;
  EdgeInsets titlePadding = EdgeInsets.only(top: 20, left: 25);
  // tasks:
  double tasksTitleOpacity = 0;
  double notFoundOpacity = 0;
  // floating button:
  double floatingButtonOpacity = 0;

  // update void
  updateHomeAnimations(
      {double newNavbarOpacity1,
      double newNavbarOpacity2,
      double newTitleOpacity,
      double newTasksTitleOpacity,
      double newNotFoundOpacity,
      double newFloatingButtonOpacity,
      EdgeInsets newTitlePadding}) {
    navbarOpacity1 =
        newNavbarOpacity1 != null ? newNavbarOpacity1 : navbarOpacity1;
    navbarOpacity2 =
        newNavbarOpacity2 != null ? newNavbarOpacity2 : navbarOpacity2;
    titleOpacity = newTitleOpacity != null ? newTitleOpacity : titleOpacity;
    tasksTitleOpacity =
        newTasksTitleOpacity != null ? newTasksTitleOpacity : tasksTitleOpacity;
    notFoundOpacity =
        newNotFoundOpacity != null ? newNotFoundOpacity : notFoundOpacity;
    floatingButtonOpacity = newFloatingButtonOpacity != null
        ? newFloatingButtonOpacity
        : floatingButtonOpacity;
    titlePadding = newTitlePadding != null ? newTitlePadding : titlePadding;
    update();
  }
}

startHomeAnimations() async {
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newNavbarOpacity1: 1,
  );
  await Future.delayed(Duration(milliseconds: 200));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newNavbarOpacity2: 1,
  );
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newTitleOpacity: 1,
    newTitlePadding: EdgeInsets.only(top: 10, left: 25),
  );
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newTasksTitleOpacity: 1,
  );
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newNotFoundOpacity: 1,
  );
  await Future.delayed(Duration(milliseconds: 500));
  Get.find<HomeAnimationsController>().updateHomeAnimations(
    newFloatingButtonOpacity: 1,
  );
}
