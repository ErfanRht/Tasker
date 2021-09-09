import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/new-task/animations.dart';
import 'package:todo/screens/new-task/components/colorpicker.dart';
import '../../../controllers/new-task/newtask-controller.dart';

class NewTaskSetup extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<NewTaskAnimationsController>(builder: (_) {
      return GetBuilder<NewTaskController>(builder: (__) {
        return Column(
          children: [
            AnimatedOpacity(
              opacity: _.textFieldOpacity,
              duration: _animationDuration,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextField(
                    textAlign: TextAlign.left,
                    maxLength: 25,
                    style: GoogleFonts.ubuntu(
                        color: _isDark ? Colors.white : __.color,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        decorationColor: Colors.white),
                    cursorColor: _isDark ? Colors.white : __.color,
                    cursorHeight: 35,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      counterText: '',
                      hintStyle: GoogleFonts.ubuntu(
                          color: _isDark
                              ? Colors.white.withOpacity(0.8)
                              : Colors.grey,
                          fontSize: 21.0),
                      hintText: "Enter task title",
                    ),
                    onChanged: (value) {
                      Get.find<NewTaskController>()
                          .updateNewTask(newText: value);
                    },
                    onTap: () {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 60),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                AnimatedOpacity(
                  opacity: _.box1Opacity,
                  duration: _animationDuration,
                  child: Container(
                    width: 125,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarMinus,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Today',
                            style: GoogleFonts.ubuntu(
                                color: Colors.grey,
                                fontSize: 17.5,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                AnimatedOpacity(
                  opacity: _.box2Opacity,
                  duration: _animationDuration,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NewTaskColorPicker();
                        },
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: __.color,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: __.color,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        );
      });
    });
  }
}
