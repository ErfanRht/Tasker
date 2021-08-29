import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/controllers/controller.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/loading/loading.dart';
import 'package:todo/screens/welcome/welcome.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  String initRoute = loading_route;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: initRoute,
      routes: {
        loading_route: (context) => LoadingScreen(),
        home_route: (context) => HomeScreen(),
        welcome_route: (context) => WelcomeScreen()
      },
    );
  }
}
