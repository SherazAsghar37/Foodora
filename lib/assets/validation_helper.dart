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
      String email, String password, String name, String phone) {
    if (email.isEmpty) {
      getAppSnackbar("Type in your email address", title: "Email");
    } else if (!GetUtils.isEmail(email)) {
      getAppSnackbar("Enter valid email address", title: "Invalid Email");
    } else if (password.isEmpty) {
      getAppSnackbar("Type in your password", title: "Password");
    } else if (password.length < 8) {
      getAppSnackbar("Password must be greater than eight characters",
          title: "Password Length");
    } else if (name.isEmpty) {
      getAppSnackbar("Type in your name", title: "Name");
    } else if (phone.isEmpty) {
      getAppSnackbar("Type in your phone", title: "Phone");
    }
  }

  static void loginValidationHelper(String email, String password) {
    if (email.isEmpty) {
      getAppSnackbar("Type in your email address", title: "Email");
    } else if (!GetUtils.isEmail(email)) {
      getAppSnackbar("Enter valid email address", title: "Invalid Email");
    } else if (password.isEmpty) {
      getAppSnackbar("Type in your password", title: "Password");
    }
  }
}
