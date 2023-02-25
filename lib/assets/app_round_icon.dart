import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppRoundIcons extends StatelessWidget {
  IconData icon;
  Color color;
  double iconsize;
  double textsize;
  double length = Dimensions.height45;
  Color backColor;

  AppRoundIcons(
      {Key? key,
      required this.color,
      required this.icon,
      this.iconsize = 0.0,
      this.textsize = 0.0,
      required this.length,
      this.backColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: length,
      width: length,
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(length / 2)),
      child: Icon(
        icon,
        size: iconsize == 0 ? Dimensions.height24 : iconsize,
        color: color,
      ),
    );
  }
}
