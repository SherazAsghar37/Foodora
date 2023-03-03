import '../../assets/app_colors.dart';
import 'package:flutter/material.dart';
import '../assets/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  bool isObscure;
  // ignore: prefer_const_constructors_in_immutables
  AppTextField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.text,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height70,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      decoration: BoxDecoration(
          color: AppColors.appWhite,
          borderRadius: BorderRadius.circular(Dimensions.height30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(1, 10),
                spreadRadius: 7,
                color: AppColors.appGrey.withOpacity(0.2))
          ]),
      child: TextField(
        controller: controller,
        obscureText: isObscure == false ? false : true,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: AppColors.maincolor,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height30)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height30),
              borderSide:
                  const BorderSide(color: AppColors.appWhite, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height30),
              borderSide:
                  const BorderSide(color: AppColors.appWhite, width: 1)),
        ),
      ),
    );
  }
}
