import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:flutter/material.dart';
import '../assets/BigFont.dart';
import '../assets/appColors.dart';
import '../assets/icons.dart';
import '../assets/dimensions.dart';
import '../assets/icons.dart';

class NameDetail extends StatelessWidget {
  var text;
  var textsize;
  var SizedBoxheight1;
  var SizedBoxheight11;
  var SizedBoxheight12;
  var SizedBoxheight13;
  var SizedBoxheight2;
  var Iconsize;
  var icontextsize;
  var smalltext;
  var starsize;
  var yAxisPadding;
  var xAxisPadding;

  NameDetail(
      {required this.text,
      this.textsize,
      this.SizedBoxheight1,
      this.SizedBoxheight2,
      this.SizedBoxheight11,
      this.SizedBoxheight12,
      this.SizedBoxheight13,
      this.Iconsize,
      this.icontextsize,
      this.smalltext,
      this.starsize,
      this.yAxisPadding,
      this.xAxisPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: yAxisPadding == null ? Dimensions.height15 : yAxisPadding,
          left: xAxisPadding == null ? Dimensions.height15 : xAxisPadding,
          right: xAxisPadding == null ? Dimensions.height15 : xAxisPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigFont(
            text: text,
            color: Colors.black,
            size: textsize == 0 ? Dimensions.height20 : textsize,
          ),
          SizedBox(
            height: SizedBoxheight1 == 0 ? Dimensions.height5 : SizedBoxheight1,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.maincolor,
                          size: starsize == 0 ? Dimensions.font10 : starsize,
                        )),
              ),
              SizedBox(
                  width: SizedBoxheight11 == 0
                      ? Dimensions.height10
                      : SizedBoxheight11),
              ThinFont(
                text: "5.0",
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              ),
              SizedBox(
                  width: SizedBoxheight12 == 0
                      ? Dimensions.height5
                      : SizedBoxheight12),
              ThinFont(
                text: "120",
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              ),
              SizedBox(
                width: SizedBoxheight13 == 0
                    ? Dimensions.height5
                    : SizedBoxheight13,
              ),
              ThinFont(
                text: "comments",
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              )
            ],
          ),
          SizedBox(
            height: SizedBoxheight2 == 0 ? Dimensions.height5 : SizedBoxheight2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcons(
                  color: Colors.orange,
                  icon: Icons.timer,
                  iconsize: Iconsize == null ? Dimensions.height20 : Iconsize,
                  text: "15 mins",
                  textsize:
                      icontextsize == 0 ? Dimensions.font15 : icontextsize),
              SizedBox(
                width: Dimensions.width10,
              ),
              AppIcons(
                  color: AppColors.maincolor,
                  icon: Icons.location_pin,
                  iconsize: Iconsize == null ? Dimensions.height20 : Iconsize,
                  text: "3 k.ms",
                  textsize:
                      icontextsize == 0 ? Dimensions.font15 : icontextsize),
              SizedBox(
                width: Dimensions.width10,
              ),
              AppIcons(
                color: Colors.blueAccent,
                icon: Icons.price_change,
                iconsize: Iconsize == null ? Dimensions.height20 : Iconsize,
                text: "10 ",
                textsize: icontextsize == 0 ? Dimensions.font15 : icontextsize,
              ),
            ],
          )
        ],
      ),
    );
  }
}
