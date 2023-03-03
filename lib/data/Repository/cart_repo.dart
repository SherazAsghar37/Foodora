import 'dart:convert';
import 'package:first/assets/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../methods/cart_method.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartMethod> cartList) {
    sharedPreferences.remove(AppConstants.cartKey);
    sharedPreferences.remove(AppConstants.cartHistoryKey);
    cart = [];
    var time = DateTime.now().toString();
    // ignore: avoid_function_literals_in_foreach_calls
    cartList.forEach((element) {
      element.time = time;
      cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.cartKey, cart);
  }

  List<CartMethod> getCartList() {
    List<String> cart = [];
    if (sharedPreferences.containsKey(AppConstants.cartKey)) {
      cart = sharedPreferences.getStringList(AppConstants.cartKey)!;
    }
    List<CartMethod> cartList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    cart.forEach(
        (element) => cartList.add(CartMethod.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartMethod> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cartHistoryKey)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.cartHistoryKey)!;
    }
    List<CartMethod> historyList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    cartHistory.forEach((element) {
      historyList.add(CartMethod.fromJson(jsonDecode(element)));
    });
    historyList.sort(((a, b) => a.time!.compareTo(b.time!)));
    return historyList;
  }

  // void addCartHistory() {
  //   if (sharedPreferences.containsKey(AppConstants.CArtHistoryKey)) {
  //     CartHistory =
  //         sharedPreferences.getStringList(AppConstants.CArtHistoryKey)!;
  //   }
  //   for (int i = 0; i < cart.length; i++) {
  //     CartHistory.add(cart[i]);
  //   }
  //   removeCart();
  //   sharedPreferences.setStringList(AppConstants.CArtHistoryKey, CartHistory);
  //   print("cart has " + CartHistory.length.toString() + "items");
  // }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.cartKey);
  }

  void addCartHistory() {
    if (sharedPreferences.containsKey(AppConstants.cartHistoryKey)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.cartHistoryKey)!;
    }
    // ignore: avoid_function_literals_in_foreach_calls
    cart.forEach((element) {
      cartHistory.add(element);
    });
    removeCart();
    sharedPreferences.setStringList(AppConstants.cartHistoryKey, cartHistory);
  }

  void removeCartHistoryList() {
    cartHistory = [];
    cart = [];
    removeCart();
    sharedPreferences.remove(AppConstants.cartHistoryKey);
  }
}
