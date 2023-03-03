// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:first/assets/Big_font.dart';
import 'package:first/data/controller/cart_controller.dart';
import 'package:first/data/controller/popular_controller.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/route_helper/route_helper.dart';
import 'package:first/shortcuts/expandable_text.dart';
import 'package:first/assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/assets/app_round_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecepiePage extends StatelessWidget {
  final int recPageId;
  final String page;
  RecepiePage({Key? key, required this.recPageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommended =
        Get.find<RecommendedProductContr>().recommendedProductList[recPageId];
    Get.find<PopularProductContr>()
        .inital(recommended, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: 60,
                title: Row(
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
                        color: AppColors.appBlack,
                        icon: Icons.arrow_back_ios,
                        length: Dimensions.height45,
                        backColor: AppColors.constant255.withOpacity(0.6),
                      ),
                    ),
                    GetBuilder<PopularProductContr>(builder: (popularProduct) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.cartPage);
                            },
                            child: AppRoundIcons(
                                color: AppColors.appBlack,
                                icon: Icons.shopping_bag,
                                length: Dimensions.height45,
                                backColor:
                                    AppColors.constant255.withOpacity(0.6)),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child:
                                Get.find<PopularProductContr>().totalItems >= 1
                                    ? AppRoundIcons(
                                        color: Colors.transparent,
                                        icon: Icons.circle,
                                        length: Dimensions.height20,
                                        backColor: AppColors.maincolor,
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
                                        size: Dimensions.height15,
                                      )
                                    : Container(),
                          )
                        ],
                      );
                    })
                  ],
                ),
                backgroundColor: AppColors.appBlack,
                expandedHeight: Dimensions.height320,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image:
                        //  NetworkImage(AppConstants.BASE_URL +
                        //     AppConstants.UPLOAD_URI +
                        //     Recommended.img!),
                        AssetImage('images/${recommended.img!}'),
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              Dimensions.width25,
                              Dimensions.height10,
                              Dimensions.width25,
                              Dimensions.height5),
                          decoration: BoxDecoration(
                              color: AppColors.appWhite,
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.height45))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BigFont(
                                  text: recommended.name!,
                                  size: Dimensions.height25),
                            ],
                          ),
                        ),
                      ],
                    ),
                    preferredSize: Size.fromHeight(Dimensions.height20))),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ExpandableText(text: recommended.description!),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductContr>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.height20,
                    left: Dimensions.width20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.getQuantity(false);
                      },
                      child: AppRoundIcons(
                        color: AppColors.appWhite,
                        icon: Icons.remove,
                        length: Dimensions.height30,
                        iconsize: Dimensions.height22,
                        backColor: AppColors.maincolor,
                      ),
                    ),
                    Center(
                        child: controller.inCartItem <= 0
                            ? BigFont(
                                text: "Price \$ ${recommended.price!}",
                                color: Colors.black,
                                size: Dimensions.height25)
                            : BigFont(
                                text:
                                    "\$ ${recommended.price! * controller.inCartItem} x ${controller.inCartItem.toString()}",
                                color: Colors.black,
                                size: Dimensions.height25)),
                    GestureDetector(
                      onTap: () {
                        controller.getQuantity(true);
                      },
                      child: AppRoundIcons(
                        color: AppColors.appWhite,
                        icon: Icons.add,
                        length: Dimensions.height30,
                        iconsize: Dimensions.height22,
                        backColor: AppColors.maincolor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    Dimensions.width20,
                    Dimensions.height20,
                    Dimensions.width20,
                    Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.height20),
                      topRight: Radius.circular(Dimensions.height20),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.appWhite,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height20)),
                              child: Icon(
                                Icons.favorite,
                                color: AppColors.maincolor,
                                size: Dimensions.height30,
                              )),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(recommended);
                      },
                      child: Container(
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
                                  "\$ ${recommended.price! * controller.inCartItem} Add To Cart",
                              color: AppColors.appWhite,
                              size: Dimensions.height20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }));
  }
}
