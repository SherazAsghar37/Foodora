import 'package:first/assets/Big_font.dart';
import 'package:first/assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpandableText extends StatefulWidget {
  final String text;
  final double screenHeight;
  double textsize;
  ExpandableText(
      {Key? key,
      required this.text,
      this.textsize = 0.0,
      this.screenHeight = 0})
      : super(
          key: key,
        );

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String SecondHalf;
  var textsize = Dimensions.height16;
  double textHeight = Dimensions.height220;

  bool hiddenText = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length.toInt() > textHeight.toInt()) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      SecondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      SecondHalf = '';
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: Dimensions.width25,
            right: Dimensions.width25,
            top: Dimensions.height10),
        child: SecondHalf.isEmpty
            ? ThinFont(
                text: widget.text,
                size: textsize,
                height: 1.8,
              )
            : Column(
                children: [
                  hiddenText
                      ? ThinFont(
                          text: "$firstHalf ....",
                          size: textsize,
                          height: 1.8,
                        )
                      : ThinFont(
                          text: (firstHalf + SecondHalf),
                          size: textsize,
                          height: 1.8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Row(
                        children: [
                          BigFont(
                            text: hiddenText ? "showmore" : "showless",
                            size: textsize + 2,
                          ),
                          Icon(
                              size: textsize * 2,
                              color: AppColors.maincolor,
                              hiddenText
                                  ? (Icons.arrow_drop_down)
                                  : Icons.arrow_drop_up)
                        ],
                      )),
                ],
              ));
  }
}
