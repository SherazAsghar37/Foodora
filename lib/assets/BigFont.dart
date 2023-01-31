import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';
class BigFont extends StatelessWidget {
  String text;
  Color? color;
  double? size ;
  TextOverflow overflow;
  BigFont({Key? key,this.color = const Color(0xFF00E676),this.overflow = TextOverflow.ellipsis,this.size,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      maxLines: 1,
      style:
        TextStyle(color: color,
      fontSize: size == 0? Dimensions.font20:size,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      overflow: overflow,
      )
    );
  }
}