import 'package:first/assets/appColors.dart';
import 'package:first/data/Repository/Popular_Reposiotry.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/methods/CartMethod.dart';
import 'package:first/methods/Product_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductContr extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductContr({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get PopularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Date Recieved");
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("data didnot recieved");
    }
  }

  void GetQuantity(bool didinitialize) {
    if (didinitialize == true) {
      print("initialized");
      _quantity = CheckQuantity(_quantity + 1);
    }
    if (didinitialize == false) {
      _quantity = CheckQuantity(_quantity - 1);
    }
    update();
  }

  void inital(ProductMethod product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.isExisted(product);

    _inCartItem = _cart.getQuantity(product);
  }

  int CheckQuantity(int Quantity) {
    if ((_inCartItem + Quantity) < 0) {
      Get.snackbar("Item Count", "You can't decrease more",
          backgroundColor: AppColors.maincolor, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItem + Quantity) > 20) {
      Get.snackbar("Item Count", "You can't add more",
          backgroundColor: AppColors.maincolor, colorText: Colors.white);
      return 20;
    } else {
      return Quantity;
    }
  }

  void addItem(ProductMethod product) {
    _cart.getItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);

    update();
  }

  int get totalItems {
    return _cart.totalItem;
  }

  List<CartMethod> get getItems {
    return _cart.getItems;
  }
}
