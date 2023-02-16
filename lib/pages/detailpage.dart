import 'package:first/assets/AppRoundIcon.dart';
import 'package:first/assets/appConstants.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/data/controller/popularController.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:first/shortcuts/Expandabletext.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/shortcuts/namedetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/BigFont.dart';

class Detailpage extends StatelessWidget {
  final int PageId;
  final String page;
  Detailpage({Key? key, required this.PageId, required this.page})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var Popular = Get.find<PopularProductContr>().PopularProductList[PageId];
    var checker = Get.find<PopularProductContr>()
        .inital(Popular, Get.find<CartController>());
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
                        AssetImage('images/${Popular.img!}'),
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
                        backColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
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
                              color: Colors.black,
                              icon: Icons.shopping_bag,
                              length: Dimensions.height45,
                              backColor: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.6)),
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
                                        color: Colors.white,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameDetail(
                    text: Popular.name!,
                    textsize: Dimensions.height25,
                    SizedBoxheight1: Dimensions.height10,
                    starsize: Dimensions.height20,
                    smalltext: Dimensions.height15,
                    SizedBoxheight2: Dimensions.height10,
                    SizedBoxheight11: Dimensions.height10,
                    SizedBoxheight13: Dimensions.height10,
                    SizedBoxheight12: Dimensions.height10,
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
                      return ExpandableText(text: Popular.description!);
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
                margin: EdgeInsets.all(0),
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
                                popularProducct.GetQuantity(false);
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
                                popularProducct.GetQuantity(true);
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
                    GetBuilder<PopularProductContr>(builder: (PopularProduct) {
                      return GestureDetector(
                          onTap: () {
                            PopularProduct.addItem(Popular);
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
                                      "Price is \$ ${Popular.price.toString()}",
                                  color: Colors.white,
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
