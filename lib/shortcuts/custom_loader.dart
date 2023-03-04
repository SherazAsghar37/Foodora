import 'package:first/assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height100,
        width: Dimensions.height100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.height100,
            ),
            color: AppColors.maincolor.withOpacity(0.5)),
        // ignore: prefer_const_constructors
        child: Center(
          child: const CircularProgressIndicator(
            color: AppColors.appWhite,
          ),
        ),
      ),
    );
  }
}
