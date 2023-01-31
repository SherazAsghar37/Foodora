import 'dart:convert';
import 'package:first/assets/appConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../methods/CartMethod.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> CartHistory = [];
  void addToCartList(List<CartMethod> cartList) {
    sharedPreferences.remove(AppConstants.CartKey);
    sharedPreferences.remove(AppConstants.CArtHistoryKey);
    cart = [];
    cartList.forEach((element) => cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CartKey, cart);
  }

  List<CartMethod> getCartList() {
    List<String> cart = [];
    if (sharedPreferences.containsKey(AppConstants.CartKey)) {
      cart = sharedPreferences.getStringList(AppConstants.CartKey)!;
    }
    List<CartMethod> cartList = [];
    cart.forEach(
        (element) => cartList.add(CartMethod.fromJson(jsonDecode(element))));
    return cartList;
  }

  // List<CartMethod> getCartHistoryList() {
  //   if (sharedPreferences.containsKey(AppConstants.CArtHistoryKey)) {
  //     CartHistory = [];
  //     CartHistory =
  //         sharedPreferences.getStringList(AppConstants.CArtHistoryKey)!;
  //   }
  //   List<CartMethod> historyList = [];
  //   CartHistory.forEach((element) {
  //     historyList.add(CartMethod.fromJson(jsonDecode(element)));
  //   });
  //   return historyList;
  // }

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
    sharedPreferences.remove(AppConstants.CartKey);
  }

  void addCartHistory() {
    if (sharedPreferences.containsKey(AppConstants.CArtHistoryKey)) {
      CartHistory =
          sharedPreferences.getStringList(AppConstants.CArtHistoryKey)!;
    }
    cart.forEach((element) {
      CartHistory.add(element);
    });
    removeCart();
    sharedPreferences.setStringList(AppConstants.CArtHistoryKey, CartHistory);
  }

  List<CartMethod> getCartHistoryList() {
    List<CartMethod> historyList = [];
    sharedPreferences
        .getStringList(AppConstants.CArtHistoryKey)!
        .forEach((element) {
      historyList.add(CartMethod.fromJson(jsonDecode(element)));
    });
    return historyList;
  }
}
