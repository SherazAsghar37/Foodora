import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIcons extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  var iconsize;
  var textsize;
  Color? backgroundColor;

  AppIcons(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      this.iconsize,
      this.textsize,
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
