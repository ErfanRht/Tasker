import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/constants/types.dart';
import 'package:todo/models/set-system-overlay-style.dart';
import 'package:todo/screens/home/animations.dart';
import 'package:todo/controllers/home-controller.dart';

class HomeNavbar extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  Duration _animationSpeed = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedOpacity(
              duration: _animationSpeed,
              opacity: _.navbarOpacity1,
              child: IconButton(
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: homeController.advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible
                            ? FontAwesomeIcons.times
                            : FontAwesomeIcons.stream,
                        color: Colors.black.withOpacity(0.40),
                        size: 22.2,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
                onPressed: () {
                  homeController.advancedDrawerController.showDrawer();
                  setSystemUIOverlayStyle(
                      systemUIOverlayStyle: SystemUIOverlayStyle.BLUE);
                },
              ),
            ),
            AnimatedOpacity(
              duration: _animationSpeed,
              opacity: _.navbarOpacity2,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.black.withOpacity(0.40),
                  size: 22.2,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    });
  }
}
