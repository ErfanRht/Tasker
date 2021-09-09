import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/models/user/user-email.dart';

class EditProfileController extends GetxController {
  String userName = "";
  String userEmail = "";
  String userAge = "";

  bool validationEmail = true;

  updateUserName({@required String name}) {
    userName = name;
    update();
  }

  updateUserEmail({@required String email}) {
    userEmail = email;
    update();
  }

  updateUserAge({@required String age}) {
    userAge = age;
    update();
  }

  updateValidations({
    @required bool newValidationEmail,
  }) {
    validationEmail = newValidationEmail;
    print(validationEmail);

    update();
  }

  resetState() {
    userName = "";
    userEmail = "";
    userAge = "";
    validationEmail = true;
    update();
  }
}

Future<bool> editProfileChecker({@required String email}) async {
  bool response = false;
  await EmailValidation(email: email).then((bool value) {
    if (email == "") {
      response = true;
    } else {
      response = value;
    }
  });
  return response;
}
