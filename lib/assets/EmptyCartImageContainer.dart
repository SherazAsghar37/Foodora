import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

class EmptyCartImageContainer extends StatelessWidget {
  final String imagePath;
  final String message;
  EmptyCartImageContainer({required this.imagePath, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: Dimensions.height220 * 1.5,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath))),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        BigFont(
          text: message,
          color: Colors.black,
        )
      ],
    );
  }
}
