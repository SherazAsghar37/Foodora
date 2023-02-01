import 'package:first/assets/AppRoundIcon.dart';
import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/methods/CartMethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    List<CartMethod> getCartHistoryList =
        Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = {};
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    var counter = 0;
    List<int> orderTimes = cartItemsPerOrderList();
    for (int i = 0; i < cartItemsPerOrder.length; i++) {
      for (int j = 0; j < orderTimes[i]; j++) {
        print("my order is " + getCartHistoryList[counter++].toString());
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.maincolor,
            ),
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
                  vertical: Dimensions.height30),
              margin: EdgeInsets.only(top: Dimensions.height100),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: Dimensions.height10,
                    color: Color.fromARGB(255, 0, 207, 107),
                    offset: Offset(0, -Dimensions.height10),
                  ),
                  BoxShadow(
                    blurRadius: Dimensions.height10,
                    color: Color.fromARGB(255, 0, 207, 107),
                    offset: Offset(Dimensions.height10, 0),
                  ),
                  BoxShadow(
                    blurRadius: Dimensions.height10,
                    color: Color.fromARGB(255, 0, 207, 107),
                    offset: Offset(-Dimensions.height10, 0),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20)),
              ),
              child: GetBuilder<CartController>(builder: (CartController) {
                return ListView.builder(
                    itemCount: cartController.PerItemList.length,
                    itemBuilder: (context, hIndex) {
                      return Column(
                        children: [
                          Text(cartController.CartPerOrderItem.keys
                              .elementAt(hIndex))
                        ],
                      );
                    });
              }),
            ),
          )
        ],
      ),
    );
  }
}
