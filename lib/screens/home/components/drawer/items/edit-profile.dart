import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/controllers/home/drawer/edit-profile-controller.dart';
import 'package:todo/models/user/user.dart';

class EditProfileDialog extends StatelessWidget {
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return GetBuilder<EditProfileController>(
        builder: (_) {
          return AlertDialog(
            backgroundColor: _isDark ? kDarkBackgroundColor2 : kBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              "Edit profile",
              style: GoogleFonts.ubuntu(
                  fontSize: 22.5,
                  fontWeight: FontWeight.w600,
                  color: _isDark ? kBackgroundColor : kDarkBackgroundColor),
            ),
            content: Container(
              height: 220,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : kDarkBackgroundColor.withOpacity(0.8)),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 2),
                          ),
                          hintText: "Name",
                          hintStyle: GoogleFonts.ubuntu(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : kDarkBackgroundColor.withOpacity(0.8)),
                        ),
                        onChanged: (value) {
                          Get.find<EditProfileController>()
                              .updateUserName(name: value);
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : kDarkBackgroundColor.withOpacity(0.8)),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 2),
                          ),
                          hintText: "Age",
                          hintStyle: GoogleFonts.ubuntu(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : kDarkBackgroundColor.withOpacity(0.8)),
                        ),
                        onChanged: (value) {
                          Get.find<EditProfileController>()
                              .updateUserAge(age: value);
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : kDarkBackgroundColor.withOpacity(0.8)),
                        decoration: InputDecoration(
                          errorText: _.validationEmail
                              ? null
                              : "Email address is not correct.",
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 2),
                          ),
                          hintText: _.userEmail != "" ? _.userEmail : "Email",
                          hintStyle: GoogleFonts.ubuntu(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : kDarkBackgroundColor.withOpacity(0.8)),
                        ),
                        onChanged: (text) {
                          Get.find<EditProfileController>()
                              .updateUserEmail(email: text);
                          editProfileChecker(
                            email: text,
                          ).then((bool value) {
                            print(value);
                            Get.find<EditProfileController>()
                                .updateValidations(newValidationEmail: value);
                          });
                        }),
                  ]),
            ),
            actions: [
              FlatButton(
                child: Text(
                  "Discard",
                  style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),
                ),
                onPressed: () {
                  Get.find<EditProfileController>().resetState();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  "Save",
                  style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _isDark
                          ? kBackgroundColor.withOpacity(0.9)
                          : kDarkBackgroundColor),
                ),
                onPressed: () {
                  editProfileChecker(email: _.userEmail).then((value) {
                    if (value) {
                      UpdateUserData(
                        name: _.userName,
                        age: _.userAge,
                        email: _.userEmail,
                      );
                      Get.find<EditProfileController>().resetState();
                      Navigator.pop(context);
                    }
                  });
                },
              ),
            ],
          );
        },
      );
    });
  }
}
