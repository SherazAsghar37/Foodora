import 'package:first/assets/AppRoundIcon.dart';
import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String Text;
  final IconData icon;
  ProfileContainer({required this.Text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width30, vertical: Dimensions.height15),
      height: Dimensions.height70 + Dimensions.height15,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppRoundIcons(
                  backColor: AppColors.maincolor.withOpacity(0.3),
                  color: AppColors.maincolor,
                  icon: icon,
                  length: Dimensions.height50),
              SizedBox(
                width: Dimensions.width20,
              ),
              BigFont(
                text: Text,
                size: Dimensions.font25 - 2,
                color: Colors.black,
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: Dimensions.height25,
            color: AppColors.maincolor,
          )
        ],
      ),
    );
  }
}
