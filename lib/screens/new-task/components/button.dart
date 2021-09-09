import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/new-task/newtask-controller.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/screens/new-task/animations.dart';

class NewTaskButton extends StatefulWidget {
  @override
  _NewTaskButtonState createState() => _NewTaskButtonState();
}

class _NewTaskButtonState extends State<NewTaskButton> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  bool get wantKeepAlive => true;
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    void _add({@required NewTaskController newTaskController}) async {
      addTask(
              text: newTaskController.text,
              colorNum: newTaskController.colorNum)
          .then((value) => {
                if (value)
                  {
                    Timer(Duration(milliseconds: 500), () {
                      _btnController.success();
                      Timer(Duration(milliseconds: 1500), () {
                        Navigator.pop(context);
                      });
                    })
                  }
                else
                  {
                    Timer(Duration(milliseconds: 500), () {
                      _btnController.error();
                      Timer(Duration(milliseconds: 1500), () {
                        _btnController.reset();
                      });
                    })
                  }
              });
    }

    return GetBuilder<NewTaskAnimationsController>(
      builder: (_) {
        return GetBuilder<NewTaskController>(
          builder: (__) {
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
                                  color: _isDark
                                      ? kDarkBackgroundColor2
                                      : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(width: 10),
                          Icon(
                            FontAwesomeIcons.chevronUp,
                            size: 20,
                            color:
                                _isDark ? kDarkBackgroundColor2 : Colors.white,
                          )
                        ],
                      ),
                      height: 63,
                      color: _isDark ? Colors.white : kSecondaryColor,
                      successColor: Colors.greenAccent,
                      errorColor: Colors.redAccent,
                      controller: _btnController,
                      onPressed: () {
                        _add(newTaskController: __);
                      },
                      valueColor:
                          _isDark ? kDarkBackgroundColor2 : Colors.white,
                    ),
                  ),
                ]),
              ),
            );
          },
        );
      },
    );
  }
}
