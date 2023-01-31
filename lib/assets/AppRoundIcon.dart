import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

class AppRoundIcons extends StatelessWidget {
  IconData icon;
  Color color;
  var iconsize;
  var textsize;
  var length = Dimensions.height45;
  var backColor;

  AppRoundIcons(
      {Key? key,
      required this.color,
      required this.icon,
      this.iconsize,
      this.textsize,
      required this.length,
      this.backColor=Colors.white})
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
