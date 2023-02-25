import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:flutter/material.dart';
import '../assets/Big_font.dart';
import '../assets/app_colors.dart';
import '../assets/icons.dart';

// ignore: must_be_immutable
class NameDetail extends StatelessWidget {
  String? text;
  double textsize;
  double sizedboxHeight1;
  double sizedboxHeight11;
  double sizedboxHeight12;
  double sizedboxHeight13;
  double sizedboxHeight2;
  double iconSize;
  double icontextsize;
  double smalltext;
  double starsize;
  double yAxisPadding;
  double xAxisPadding;
  final int starCount;
  final String price;
  final String location;
  NameDetail(
      {super.key,
      this.location = "3 kms",
      this.price = '10',
      this.starCount = 5,
      required this.text,
      this.textsize = 0.0,
      this.sizedboxHeight1 = 0.0,
      this.sizedboxHeight2 = 0.0,
      this.sizedboxHeight11 = 0.0,
      this.sizedboxHeight12 = 0.0,
      this.sizedboxHeight13 = 0.0,
      this.iconSize = 0.0,
      this.icontextsize = 0.0,
      this.smalltext = 0.0,
      this.starsize = 0.0,
      this.yAxisPadding = 0.0,
      this.xAxisPadding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: yAxisPadding == 0.0 ? Dimensions.height15 : yAxisPadding,
          left: xAxisPadding == 0.0 ? Dimensions.height15 : xAxisPadding,
          right: xAxisPadding == 0.0 ? Dimensions.height15 : xAxisPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigFont(
            text: text!,
            color: AppColors.appBlack,
            size: textsize == 0 ? Dimensions.height20 : textsize,
          ),
          SizedBox(
            height: sizedboxHeight1 == 0 ? Dimensions.height5 : sizedboxHeight1,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    starCount == 0.0 ? 5 : starCount,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.maincolor,
                          size: starsize == 0 ? Dimensions.font10 : starsize,
                        )),
              ),
              SizedBox(
                  width: sizedboxHeight11 == 0
                      ? Dimensions.height10
                      : sizedboxHeight11),
              ThinFont(
                text:
                    starCount.toString() == '0.0' ? "5" : starCount.toString(),
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              ),
              SizedBox(
                  width: sizedboxHeight12 == 0
                      ? Dimensions.height5
                      : sizedboxHeight12),
              ThinFont(
                text: "120",
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              ),
              SizedBox(
                width: sizedboxHeight13 == 0
                    ? Dimensions.height5
                    : sizedboxHeight13,
              ),
              ThinFont(
                text: "comments",
                size: smalltext == 0 ? Dimensions.font12 : smalltext,
              )
            ],
          ),
          SizedBox(
            height: sizedboxHeight2 == 0 ? Dimensions.height5 : sizedboxHeight2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcons(
                  color: AppColors.appOrange,
                  icon: Icons.timer,
                  iconsize: iconSize == 0.0 ? Dimensions.height20 : iconSize,
                  text: "15 mins",
                  textsize:
                      icontextsize == 0.0 ? Dimensions.font15 : icontextsize),
              SizedBox(
                width: Dimensions.width10,
              ),
              AppIcons(
                  color: AppColors.maincolor,
                  icon: Icons.location_pin,
                  iconsize: iconSize == 0.0 ? Dimensions.height20 : iconSize,
                  text: location.isEmpty ? "3 kms" : location,
                  textsize:
                      icontextsize == 0 ? Dimensions.font15 : icontextsize),
              SizedBox(
                width: Dimensions.width10,
              ),
              AppIcons(
                color: AppColors.appBlueAccent,
                icon: Icons.price_change,
                iconsize: iconSize == 0.0 ? Dimensions.height20 : iconSize,
                text: price.isEmpty ? '10' : price,
                textsize: icontextsize == 0 ? Dimensions.font15 : icontextsize,
              ),
            ],
          )
        ],
      ),
    );
  }
}
