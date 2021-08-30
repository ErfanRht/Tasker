import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/controller.dart';

class HomeNavbar extends StatefulWidget {
  @override
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  HomeController homeController = Get.put(HomeController());

  double _opacity, _opacity2;
  Duration _animationSpeed;

  @override
  void initState() {
    super.initState();
    _opacity = 0;
    _opacity2 = 0;
    _animationSpeed = Duration(milliseconds: 500);
    _animationController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedOpacity(
            duration: _animationSpeed,
            opacity: _opacity,
            child: IconButton(
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: homeController.advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible
                          ? FontAwesomeIcons.times
                          : FontAwesomeIcons.bars,
                      color: Colors.black.withOpacity(0.40),
                      size: 22.2,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
              onPressed: () {
                homeController.advancedDrawerController.showDrawer();
              },
            ),
          ),
          AnimatedOpacity(
            duration: _animationSpeed,
            opacity: _opacity2,
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
  }

  _animationController() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _opacity = 1;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _opacity2 = 1;
    });
  }
}
