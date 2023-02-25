import 'package:first/assets/app_round_icon.dart';
import 'package:first/assets/Big_font.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/assets/smallFont.dart';
import 'package:first/data/controller/popular_controller.dart';
import 'package:first/pages/homepage.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/EmptyCart_image_ontainer.dart';
import '../../assets/app_colors.dart';
import '../../data/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  final String page;
  const CartPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appWhite,
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
                          color: AppColors.appWhite,
                          icon: Icons.arrow_back,
                          length: Dimensions.height20 * 2,
                          backColor: AppColors.maincolor),
                    ),
                    SizedBox(
                      width: Dimensions.width20 * 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HomePage());
                      },
                      child: AppRoundIcons(
                          color: AppColors.appWhite,
                          icon: Icons.home_outlined,
                          length: Dimensions.height20 * 2,
                          backColor: AppColors.maincolor),
                    ),
                    AppRoundIcons(
                        color: AppColors.appWhite,
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
                  color: AppColors.appWhite,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(
                      builder: (controller) {
                        var cartmodel = controller.getItems;
                        return cartmodel.isNotEmpty
                            ? ListView.builder(
                                itemCount: cartmodel.length,
                                itemBuilder: ((_, index) {
                                  return SizedBox(
                                    height: Dimensions.height100,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (page != 'CartHistory') {
                                              var popularIndex = Get.find<
                                                      PopularProductContr>()
                                                  .popularProductList
                                                  .indexOf(
                                                      cartmodel[index].product);
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
                                                color: AppColors.appWhite,
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
                                                color: AppColors.appWhite,
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
                                                  text: "Total",
                                                  size: Dimensions.height20,
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
                                                                cartmodel[index]
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
                                                          cartmodel[index]
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
                                                                cartmodel[index]
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
                            color: AppColors.appWhite,
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
