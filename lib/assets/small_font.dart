import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThinFont extends StatelessWidget {
  String text;
  Color color;
  double? size;
  TextOverflow overflow;
  double height;
  ThinFont(
      {Key? key,
      this.height = 1.2,
      this.color = const Color(0xFFccc7c5),
      this.overflow = TextOverflow.fade,
      this.size,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size == 0 ? Dimensions.font12 : size,
            fontFamily: 'Roboto',
            overflow: overflow,
            height: height));
  }
}
