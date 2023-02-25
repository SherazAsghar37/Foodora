import 'package:dots_indicator/dots_indicator.dart';
import 'package:first/assets/Big_font.dart';
import 'package:first/assets/smallFont.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/methods/Product_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/app_colors.dart';
import '../assets/dimensions.dart';
import '../data/controller/popular_controller.dart';
import '../route_helper/routeHelper.dart';
import '../shortcuts/namedetail.dart';

class PageBody extends StatefulWidget {
  const PageBody({super.key});

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPagevalue = 0.0;
  var scaleFactor = 0.8;
  var height = Dimensions.height220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPagevalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductContr>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? SizedBox(
                  height: Dimensions.height320,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProduct.popularProductList.length,
                    itemBuilder: (context, Position) {
                      return FirstBody(Position,
                          popularProduct.popularProductList[Position]);
                    },
                  ),
                )
              : const CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
        }),
        GetBuilder<PopularProductContr>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: currPagevalue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColors.maincolor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.height5)),
            ),
          );
        }),
        Container(
          margin: EdgeInsets.fromLTRB(
              Dimensions.width20, Dimensions.height20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigFont(
                text: "Recommended",
                color: Colors.black,
                size: Dimensions.height22,
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height5),
                  child: ThinFont(text: ".")),
              SizedBox(width: Dimensions.width10),
              ThinFont(text: "Food Pairing")
            ],
          ),
        ),
        GetBuilder<RecommendedProductContr>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<RecommendedProductContr>(
                        builder: (recommendedProduct) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFoodPage(
                              index, "Home"));
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(
                                Dimensions.width20, 0, 0, 0),
                            child: Stack(
                              children: [
                                Container(
                                  height: Dimensions.height120,
                                  width: Dimensions.width120,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.height10,
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.shadowColor,
                                        blurRadius: Dimensions.height5,
                                        offset: Offset(0, Dimensions.height5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.height20),
                                    image: DecorationImage(
                                        image:
                                            //  NetworkImage(AppConstants
                                            //         .BASE_URL +
                                            //     AppConstants.UPLOAD_URI +
                                            //     recommendedProduct
                                            //         .recommendedProductList[index]
                                            //         .img!),
                                            // fit: BoxFit.cover
                                            AssetImage(
                                                'images/${recommendedProduct.recommendedProductList[index].img!}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GetBuilder<RecommendedProductContr>(
                                        builder: (recommendedProduct) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.all(Dimensions.height10),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              Dimensions.height100 -
                                                  Dimensions.height10,
                                              Dimensions.height10,
                                              Dimensions.width20,
                                              Dimensions.height10),
                                          height: Dimensions.height100,
                                          //width: 1000,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: AppColors.appWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.shadowColor,
                                                  blurRadius:
                                                      Dimensions.height5,
                                                  offset: Offset(
                                                      0, Dimensions.height5),
                                                ),
                                                BoxShadow(
                                                  color: AppColors.appWhite,
                                                  //blurRadius:5,
                                                  offset: Offset(
                                                      Dimensions.width5, 0),
                                                ),
                                                BoxShadow(
                                                  color: AppColors.appWhite,
                                                  //blurRadius:5,
                                                  offset: Offset(
                                                      -Dimensions.width5, 0),
                                                )
                                              ]),
                                          child: NameDetail(
                                            text: recommendedProduct
                                                .recommendedProductList[index]
                                                .name!,
                                            price: recommendedProduct
                                                .recommendedProductList[index]
                                                .price
                                                .toString(),
                                            textsize: Dimensions.height20,
                                            sizedboxHeight1: Dimensions.height5,
                                            starsize: Dimensions.height15,
                                            smalltext: Dimensions.font12,
                                            starCount: recommendedProduct
                                                .recommendedProductList[index]
                                                .stars!,
                                            sizedboxHeight2:
                                                Dimensions.height10,
                                            sizedboxHeight11:
                                                Dimensions.height10,
                                            sizedboxHeight13:
                                                Dimensions.height10,
                                            sizedboxHeight12:
                                                Dimensions.height10,
                                            iconSize: Dimensions.height22,
                                            icontextsize: Dimensions.font12,
                                          ),
                                        ),
                                      );
                                    }))
                              ],
                            )),
                      );
                    });
                  })
              : const CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
        })
      ],
    );
  }

  // ignore: non_constant_identifier_names
  FirstBody(index, ProductMethod popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currPagevalue.floor()) {
      var currScale = 1 - (currPagevalue - index) * (1 - scaleFactor);
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPagevalue.floor() + 1) {
      var currScale =
          scaleFactor + (currPagevalue - index + 1) * (1 - scaleFactor);
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPagevalue.floor() - 1) {
      var currScale = 1 - (currPagevalue - index) * (1 - scaleFactor);
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      var currScale = 0.8;
      var currtrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFoodPage(index, "home"));
            },
            child: GetBuilder<PopularProductContr>(builder: (popularproduct) {
              return Container(
                height: Dimensions.height220,
                margin: EdgeInsets.only(
                    left: Dimensions.width5,
                    right: Dimensions.width5,
                    top: Dimensions.height5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: index.isEven
                      ? AppColors.appOrange
                      : AppColors.appBlueAccent,
                  image: DecorationImage(
                      image:
                          //  NetworkImage(AppConstants.BASE_URL +
                          //     AppConstants.UPLOAD_URI +
                          //     popularProduct.img!),
                          AssetImage('images/${popularProduct.img!}'),
                      fit: BoxFit.cover),
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(Dimensions.width25,
                  Dimensions.height10, Dimensions.width25, Dimensions.height20),
              height: Dimensions.height120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  //color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: Dimensions.height5,
                      offset: Offset(0, Dimensions.height5),
                    ),
                    BoxShadow(
                      color: AppColors.appWhite,
                      //blurRadius:5,
                      offset: Offset(Dimensions.width5, 0),
                    ),
                    BoxShadow(
                        color: AppColors.appWhite,
                        //blurRadius:5,
                        offset: Offset(-Dimensions.width5, 0))
                  ]),
              child: NameDetail(
                price: popularProduct.price.toString(),
                text: popularProduct.name.toString(),
                textsize: Dimensions.height25,
                sizedboxHeight1: Dimensions.height10,
                starCount: popularProduct.stars!,
                starsize: Dimensions.height20,
                smalltext: Dimensions.height15,
                sizedboxHeight2: Dimensions.height10,
                sizedboxHeight11: Dimensions.height10,
                sizedboxHeight13: Dimensions.height10,
                sizedboxHeight12: Dimensions.height10,
                iconSize: Dimensions.height25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
