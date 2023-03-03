import 'package:first/assets/dimensions.dart';
import 'package:first/assets/small_font.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class AppIcons extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  double iconsize;
  double textsize;
  Color? backgroundColor;

  AppIcons(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      this.iconsize = 24,
      this.textsize = 24,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
            size: iconsize == 0 ? Dimensions.height24 : iconsize,
            color: color,
          ),
          SizedBox(
            width: Dimensions.width5,
          ),
          ThinFont(
            text: text,
            size: textsize == Dimensions.font12 ? Dimensions.font12 : textsize,
          )
        ],
      ),
    );
  }
}
