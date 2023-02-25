import 'package:first/assets/Big_font.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

class EmptyCartImageContainer extends StatelessWidget {
  final String imagePath;
  final String message;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
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
