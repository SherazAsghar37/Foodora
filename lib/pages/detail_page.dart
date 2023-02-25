import 'package:first/assets/app_round_icon.dart';
import 'package:first/data/controller/popular_controller.dart';
import 'package:first/shortcuts/expandable_text.dart';
import 'package:first/assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/shortcuts/namedetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/Big_font.dart';
import '../data/controller/cart_controller.dart';
import '../route_helper/routeHelper.dart';

class Detailpage extends StatelessWidget {
  final int pageId;
  final String page;
  const Detailpage({Key? key, required this.pageId, required this.page})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var popularProducts =
        Get.find<PopularProductContr>().popularProductList[pageId];
    Get.find<PopularProductContr>()
        .inital(popularProducts, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Dimensions.height350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        //  NetworkImage(AppConstants.BASE_URL +
                        //     AppConstants.UPLOAD_URI +
                        //     Popular.img!),
                        AssetImage('images/${popularProducts.img!}'),
                    fit: BoxFit.cover)),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(Dimensions.width20,
                  Dimensions.height30, Dimensions.width20, Dimensions.height30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartPage") {
                          Get.toNamed(RouteHelper.cartPage);
                        } else {
                          Get.toNamed(RouteHelper.initial);
                        }
                      },
                      child: AppRoundIcons(
                        color: Colors.black,
                        icon: Icons.arrow_back_ios,
                        length: Dimensions.height45,
                        backColor: AppColors.constant255.withOpacity(0.6),
                      )),
                  GetBuilder<PopularProductContr>(builder: (popularProduct) {
                    return GestureDetector(
                      onTap: () {
                        if (popularProduct.totalItems >= 1) {
                          Get.toNamed(RouteHelper.cartPage);
                        }
                      },
                      child: Stack(
                        children: [
                          AppRoundIcons(
                              color: AppColors.appBlack,
                              icon: Icons.shopping_bag,
                              length: Dimensions.height45,
                              backColor:
                                  AppColors.constant255.withOpacity(0.6)),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: popularProduct.totalItems >= 1
                                ? GestureDetector(
                                    child: AppRoundIcons(
                                      color: Colors.transparent,
                                      icon: Icons.circle,
                                      length: Dimensions.height20,
                                      backColor: AppColors.maincolor,
                                    ),
                                  )
                                : Container(),
                          ),
                          Positioned(
                            left: 4,
                            top: 1,
                            child:
                                Get.find<PopularProductContr>().totalItems >= 1
                                    ? BigFont(
                                        text: Get.find<PopularProductContr>()
                                            .totalItems
                                            .toString(),
                                        color: AppColors.appWhite,
                                      )
                                    : Container(),
                          )
                        ],
                      ),
                    );
                  })
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // ignore: sort_child_properties_last
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameDetail(
                    text: popularProducts.name!,
                    textsize: Dimensions.height25,
                    sizedboxHeight1: Dimensions.height10,
                    starsize: Dimensions.height20,
                    smalltext: Dimensions.height15,
                    sizedboxHeight2: Dimensions.height10,
                    sizedboxHeight11: Dimensions.height10,
                    sizedboxHeight13: Dimensions.height10,
                    sizedboxHeight12: Dimensions.height10,
                    yAxisPadding: Dimensions.height15,
                    xAxisPadding: Dimensions.height25,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(Dimensions.width25,
                        Dimensions.height30, Dimensions.width25, 0),
                    child: BigFont(
                      text: "Information",
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  Expanded(child: SingleChildScrollView(
                    child: GetBuilder<PopularProductContr>(
                        builder: (popularProduct) {
                      return ExpandableText(text: popularProducts.description!);
                    }),
                  )),
                ],
              ),
              height: Get.context!.height -
                  Dimensions.height350 +
                  Dimensions.height15 -
                  Dimensions.height100,
              margin: EdgeInsets.only(bottom: Dimensions.height115 - 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.height20),
                      topLeft: Radius.circular(Dimensions.height20))),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    Dimensions.width25,
                    Dimensions.height15,
                    Dimensions.width25,
                    Dimensions.height15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF5F5F5),
                          blurRadius: Dimensions.height5,
                          offset: Offset(0, -Dimensions.height5))
                    ],
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.height20),
                        topLeft: Radius.circular(Dimensions.height20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                      ),
                      child: GetBuilder<PopularProductContr>(
                          builder: (popularProducct) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                popularProducct.getQuantity(false);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      right: Dimensions.height5),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: Dimensions.height20,
                                  )),
                            ),
                            BigFont(
                              text: popularProducct.inCartItem.toString(),
                              color: Colors.black,
                              size: Dimensions.height20,
                            ),
                            GestureDetector(
                              onTap: () {
                                popularProducct.getQuantity(true);
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: Dimensions.height5),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: Dimensions.height20,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    GetBuilder<PopularProductContr>(builder: (popularProduct) {
                      return GestureDetector(
                          onTap: () {
                            popularProduct.addItem(popularProducts);
                          },
                          child: Container(
                            height: Dimensions.height70,
                            padding: EdgeInsets.all(Dimensions.height20),
                            decoration: BoxDecoration(
                              color: AppColors.maincolor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigFont(
                                  text:
                                      "Price is \$ ${popularProducts.price.toString()}",
                                  color: AppColors.appWhite,
                                  size: Dimensions.height20,
                                ),
                              ],
                            ),
                          ));
                    })
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
