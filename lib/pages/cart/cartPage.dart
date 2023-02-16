import 'package:first/assets/AppRoundIcon.dart';
import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/appConstants.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/data/controller/popularController.dart';
import 'package:first/pages/homepage.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/EmptyCartImageContainer.dart';

class CartPage extends StatelessWidget {
  final String page;
  CartPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height20 * 3,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: AppRoundIcons(
                          color: Colors.white,
                          icon: Icons.arrow_back,
                          length: Dimensions.height20 * 2,
                          backColor: AppColors.maincolor),
                    ),
                    SizedBox(
                      width: Dimensions.width20 * 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => HomePage());
                      },
                      child: AppRoundIcons(
                          color: Colors.white,
                          icon: Icons.home_outlined,
                          length: Dimensions.height20 * 2,
                          backColor: AppColors.maincolor),
                    ),
                    AppRoundIcons(
                        color: Colors.white,
                        icon: Icons.shopping_cart_outlined,
                        length: Dimensions.height20 * 2,
                        backColor: AppColors.maincolor)
                  ],
                )),
            Positioned(
                top: Dimensions.height110,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(
                      builder: (controller) {
                        var _cartmodel = controller.getItems;
                        return _cartmodel.length > 0
                            ? ListView.builder(
                                itemCount: _cartmodel.length,
                                itemBuilder: ((_, index) {
                                  return Container(
                                    height: Dimensions.height100,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (page != 'CartHistory') {
                                              var popularIndex = Get.find<
                                                      PopularProductContr>()
                                                  .PopularProductList
                                                  .indexOf(_cartmodel[index]
                                                      .product);
                                              if (popularIndex >= 0) {
                                                Get.toNamed(RouteHelper
                                                    .getPopularFoodPage(
                                                        index, "cartPage"));
                                              } else {
                                                Get.toNamed(RouteHelper
                                                    .getRecommendedFoodPage(
                                                        index, "cartPage"));
                                              }
                                            } else {
                                              Get.snackbar("Product Error",
                                                  "Sorry you can't visit from here");
                                            }
                                          },
                                          child: Container(
                                            height: Dimensions.height100,
                                            width: Dimensions.height100,
                                            margin: EdgeInsets.only(
                                                bottom: Dimensions.height10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image:
                                                        //  NetworkImage(
                                                        //     AppConstants.BASE_URL +
                                                        //         AppConstants
                                                        //             .UPLOAD_URI +
                                                        //         controller
                                                        //             .getItems[index]
                                                        //             .img!),
                                                        AssetImage(
                                                            'images/${controller.getItems[index].img!}'),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.height20)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                Dimensions.height5,
                                                Dimensions.height5,
                                                Dimensions.height5,
                                                Dimensions.height5),
                                            height: Dimensions.height100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        Dimensions.height20),
                                                    bottomRight:
                                                        Radius.circular(
                                                            Dimensions
                                                                .height20))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BigFont(
                                                  text: controller
                                                      .getItems[index].name
                                                      .toString(),
                                                  color: Colors.black,
                                                  size: Dimensions.height25,
                                                ),
                                                ThinFont(
                                                  text: "some info",
                                                  size: Dimensions.height15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GetBuilder<CartController>(
                                                        builder:
                                                            (cartController) {
                                                      return BigFont(
                                                        text:
                                                            "\$ ${controller.getItems[index].price! * controller.getItems[index].quantity!}",
                                                        size:
                                                            Dimensions.height20,
                                                        color: Colors.redAccent,
                                                      );
                                                    }),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.getItem(
                                                                _cartmodel[
                                                                        index]
                                                                    .product!,
                                                                -1);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: Dimensions
                                                                .height20,
                                                          ),
                                                        ),
                                                        Text(
                                                          _cartmodel[index]
                                                              .quantity
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .height20),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.getItem(
                                                                _cartmodel[
                                                                        index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            size: Dimensions
                                                                .height20,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }))
                            : EmptyCartImageContainer(
                                imagePath: 'images/EmptyCart.png',
                                message: "Cart is Currently Empty",
                              );
                      },
                    ),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height20)),
                            child: BigFont(
                                size: Dimensions.height20,
                                text: "\$ ${controller.totalPrice.toString()}"),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        decoration: BoxDecoration(
                          color: AppColors.maincolor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.addToHistory();
                            Get.toNamed(RouteHelper.initial);
                          },
                          child: BigFont(
                            text: "Check out",
                            color: Colors.white,
                            size: Dimensions.height20,
                          ),
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
