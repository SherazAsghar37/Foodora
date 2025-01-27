import 'package:first/assets/app_round_icon.dart';
import 'package:first/assets/big_font.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/route_helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../assets/emptycart_image_ontainer.dart';
import '../../assets/app_colors.dart';
import '../../data/controller/cart_controller.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    Widget dateFormater(int index) {
      DateTime parsed = DateFormat("yyyy-mm-dd hh:mm:ss")
          .parse(cartController.cartPerOrderItem.keys.elementAt(index));
      var inputdate = DateTime.parse(parsed.toString());
      var outputFormat = DateFormat("dd/mm/yyyy hh:mm: a").format(inputdate);
      return Text(outputFormat);
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.maincolor,
            height: Dimensions.height120,
            width: double.maxFinite,
            padding: EdgeInsets.fromLTRB(Dimensions.height30,
                Dimensions.height30, Dimensions.height30, Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigFont(
                  text: "Cart History",
                  size: Dimensions.height20 + 5,
                  color: Colors.white,
                ),
                AppRoundIcons(
                  color: AppColors.maincolor,
                  icon: Icons.shopping_cart_outlined,
                  length: Dimensions.height30 + 5,
                  backColor: Colors.white,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                ),
                margin: EdgeInsets.only(top: Dimensions.height100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: Dimensions.height10,
                      color: AppColors.greenShadowColor,
                      offset: Offset(0, -Dimensions.height10),
                    ),
                    BoxShadow(
                      blurRadius: Dimensions.height10,
                      color: AppColors.greenShadowColor,
                      offset: Offset(Dimensions.height10, 0),
                    ),
                    BoxShadow(
                      blurRadius: Dimensions.height10,
                      color: AppColors.greenShadowColor,
                      offset: Offset(-Dimensions.height10, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.height20),
                      topRight: Radius.circular(Dimensions.height20)),
                ),
                child: cartController.getCartHistoryList().isNotEmpty
                    ? GetBuilder<CartController>(builder: (cartController) {
                        return ListView.builder(
                            itemCount: cartController.perItemList.length,
                            itemBuilder: (context, hIndex) {
                              var itemcout = cartController.perItemList.length;
                              var reversedindex = itemcout - 1 - hIndex;
                              cartController.pictureListGenerator();

                              return SizedBox(
                                height:
                                    Dimensions.height120 + Dimensions.height20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        dateFormater(reversedindex),
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: Dimensions.height15),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: PageView.builder(
                                                controller: PageController(
                                                    viewportFraction: 1 / 3.5),
                                                padEnds: false,
                                                itemCount: cartController
                                                    .perItemList[reversedindex],
                                                itemBuilder:
                                                    (((context, position) {
                                                  var nestedList =
                                                      cartController
                                                          .nestedCartMethods
                                                          .reversed;
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        right:
                                                            Dimensions.width5),
                                                    height:
                                                        Dimensions.height70 +
                                                            Dimensions.height10,
                                                    width: Dimensions.width50 +
                                                        Dimensions.width30,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .height15),
                                                        color: Colors.red,
                                                        image: DecorationImage(
                                                            image:
                                                                // NetworkImage(AppConstants
                                                                //         .BASE_URL +
                                                                //     AppConstants
                                                                //         .UPLOAD_URI +
                                                                //     nestedList
                                                                //         .elementAt(hIndex)[
                                                                //             position]
                                                                //         .keys
                                                                //         .elementAt(
                                                                //             0)),
                                                                AssetImage(
                                                                    'images/${nestedList.elementAt(hIndex)[position].keys.elementAt(0)}'),
                                                            fit: BoxFit.cover)),
                                                  );
                                                }))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                Dimensions.height10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${cartController.cartPerOrderItem[cartController.cartPerOrderItem.keys.elementAt(reversedindex).toString()]} Items",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    cartController
                                                        .constructReCartMap(
                                                            cartController
                                                                .cartPerOrderItem
                                                                .keys
                                                                .elementAt(
                                                                    reversedindex));
                                                    cartController.setItems();
                                                    Get.toNamed(
                                                        RouteHelper.getCartpage(
                                                            'CartHistory'));
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        Dimensions.height5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .height10),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: AppColors
                                                                .maincolor)),
                                                    child: Text(
                                                      "Add more",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .maincolor,
                                                          fontSize: Dimensions
                                                              .height15),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                  ],
                                ),
                              );
                            });
                      })
                    : EmptyCartImageContainer(
                        imagePath: "images/EmptyBox.png",
                        message: "You didn't purchased anything yet",
                      )),
          )
        ],
      ),
    );
  }
}
