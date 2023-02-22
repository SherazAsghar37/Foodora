import 'package:first/assets/appColors.dart';
import 'package:flutter/material.dart';
import '../assets/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  AppTextField(
      {required this.controller, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height70,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.height30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 10),
                spreadRadius: 7,
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        controller: controller,
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
              borderSide: BorderSide(color: Colors.white, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height30),
              borderSide: BorderSide(color: Colors.white, width: 1)),
        ),
      ),
    );
  }
}
