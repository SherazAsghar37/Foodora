import 'package:dots_indicator/dots_indicator.dart';
import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/appConstants.dart';
import 'package:first/assets/smallFont.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/methods/Product_methods.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/dimensions.dart';
import '../data/controller/popularController.dart';
import '../shortcuts/namedetail.dart';

class PageBody extends StatefulWidget {
  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPagevalue = 0.0;
  var ScaleFactor = 0.8;
  var _height = Dimensions.height220;
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
              ? Container(
                  height: Dimensions.height320,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProduct.PopularProductList.length,
                    itemBuilder: (context, Position) {
                      return FirstBody(Position,
                          popularProduct.PopularProductList[Position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
        }),
        GetBuilder<PopularProductContr>(builder: (PopularProduct) {
          return DotsIndicator(
            dotsCount: PopularProduct.PopularProductList.isEmpty
                ? 1
                : PopularProduct.PopularProductList.length,
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
                  margin: EdgeInsets.only(bottom: 5),
                  child: ThinFont(text: ".")),
              SizedBox(width: Dimensions.width10),
              ThinFont(text: "Food Pairing")
            ],
          ),
        ),
        GetBuilder<RecommendedProductContr>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                        color:
                                            Color.fromARGB(255, 209, 208, 208),
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
                                                'images/${recommendedProduct.recommendedProductList[index].img!}')),
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
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFFe8e8e8),
                                                  blurRadius:
                                                      Dimensions.height5,
                                                  offset: Offset(
                                                      0, Dimensions.height5),
                                                ),
                                                BoxShadow(
                                                  color: Colors.white,
                                                  //blurRadius:5,
                                                  offset: Offset(
                                                      Dimensions.width5, 0),
                                                ),
                                                BoxShadow(
                                                  color: Colors.white,
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
                                            SizedBoxheight1: Dimensions.height5,
                                            starsize: Dimensions.height15,
                                            smalltext: Dimensions.font12,
                                            starCount: recommendedProduct
                                                .recommendedProductList[index]
                                                .stars!,
                                            SizedBoxheight2:
                                                Dimensions.height10,
                                            SizedBoxheight11:
                                                Dimensions.height10,
                                            SizedBoxheight13:
                                                Dimensions.height10,
                                            SizedBoxheight12:
                                                Dimensions.height10,
                                            Iconsize: Dimensions.height22,
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
              : CircularProgressIndicator(
                  color: AppColors.maincolor,
                );
        })
      ],
    );
  }

  FirstBody(index, ProductMethod popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currPagevalue.floor()) {
      var currScale = 1 - (currPagevalue - index) * (1 - ScaleFactor);
      var currtrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPagevalue.floor() + 1) {
      var currScale =
          ScaleFactor + (currPagevalue - index + 1) * (1 - ScaleFactor);
      var currtrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currPagevalue.floor() - 1) {
      var currScale = 1 - (currPagevalue - index) * (1 - ScaleFactor);
      var currtrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      var currScale = 0.8;
      var currtrans = _height * (1 - currScale) / 2;
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
            child: GetBuilder<PopularProductContr>(builder: (PopularProduct) {
              return Container(
                height: Dimensions.height220,
                margin: EdgeInsets.only(
                    left: Dimensions.width5,
                    right: Dimensions.width5,
                    top: Dimensions.height5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: index.isEven ? Color(0xFFDD2C00) : Color(0xFFDD2c200),
                  image: DecorationImage(
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URI +
                          popularProduct.img!),
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
                      color: Color(0xFFe8e8e8),
                      blurRadius: Dimensions.height5,
                      offset: Offset(0, Dimensions.height5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      //blurRadius:5,
                      offset: Offset(Dimensions.width5, 0),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        //blurRadius:5,
                        offset: Offset(-Dimensions.width5, 0))
                  ]),
              child: NameDetail(
                price: popularProduct.price.toString(),
                text: popularProduct.name,
                textsize: Dimensions.height25,
                SizedBoxheight1: Dimensions.height10,
                starCount: popularProduct.stars!,
                starsize: Dimensions.height20,
                smalltext: Dimensions.height15,
                SizedBoxheight2: Dimensions.height10,
                SizedBoxheight11: Dimensions.height10,
                SizedBoxheight13: Dimensions.height10,
                SizedBoxheight12: Dimensions.height10,
                Iconsize: Dimensions.height25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
