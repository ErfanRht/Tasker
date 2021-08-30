import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/routes.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/screens/home/new-task/animations.dart';
import 'package:todo/screens/home/new-task/controller.dart';

class NewTaskButton extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();

    void _add() async {
      addTask().then((value) => {
            if (value)
              {
                Timer(Duration(seconds: 1), () {
                  _btnController.success();
                  Timer(Duration(milliseconds: 1500), () {
                    Navigator.pop(context);
                  });
                })
              }
            else
              {
                Timer(Duration(seconds: 1), () {
                  _btnController.error();
                  Timer(Duration(milliseconds: 1500), () {
                    _btnController.reset();
                  });
                })
              }
          });
    }

    return GetBuilder<NewTaskAnimationsController>(
      initState: (_) {},
      builder: (_) {
        return AnimatedOpacity(
          opacity: _.addButtonOpacity,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: EdgeInsets.only(right: 30, bottom: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                width: 225,
                child: RoundedLoadingButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text('New task',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.chevronUp,
                        size: 20,
                      )
                    ],
                  ),
                  height: 63,
                  color: kSecondaryColor,
                  successColor: Colors.greenAccent,
                  errorColor: Colors.redAccent,
                  controller: _btnController,
                  onPressed: _add,
                  valueColor: Colors.white,
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
