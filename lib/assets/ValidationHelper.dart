import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class VAlidationHelper {
  static void getAppSnackbar(String message,
      {bool isError = true, String title = "Error"}) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: AppColors.maincolor.withOpacity(0.7));
  }

  static void validationHelper(
      String Email, String Password, String Name, String Phone) {
    if (Email.isEmpty) {
      getAppSnackbar("Type in your email address", title: "Email");
    } else if (!GetUtils.isEmail(Email)) {
      getAppSnackbar("Enter valid email address", title: "Invalid Email");
    } else if (Password.isEmpty) {
      getAppSnackbar("Type in your password", title: "Password");
    } else if (Password.length < 8) {
      getAppSnackbar("Password must be greater than eight characters",
          title: "Password Length");
    } else if (Name.isEmpty) {
      getAppSnackbar("Type in your name", title: "Name");
    } else if (Phone.isEmpty) {
      getAppSnackbar("Type in your phone", title: "Phone");
    }
  }
}
