import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/home/new-task/animations.dart';
import 'controller.dart';

class NewTaskSetup extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewTaskAnimationsController>(builder: (_) {
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
                      color: kSecondaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      decorationColor: Colors.white),
                  cursorColor: kSecondaryColor,
                  cursorHeight: 35,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    counterText: '',
                    hintStyle:
                        GoogleFonts.ubuntu(color: Colors.grey, fontSize: 21.0),
                    hintText: "Enter new task",
                  ),
                  onChanged: (value) {
                    Get.find<NewTaskController>().updateNewTask(newText: value);
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
                          color: kSecondaryColor,
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
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      );
    });
  }
}
