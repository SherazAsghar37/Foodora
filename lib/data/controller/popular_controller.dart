import 'package:first/assets/app_colors.dart';
import 'package:first/data/Repository/popular_reposiotry.dart';
import 'package:first/methods/cart_method.dart';
import 'package:first/methods/product_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class PopularProductContr extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductContr({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
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
      _popularProductList.addAll(Products.fromJson(response.body[1]).products);
      _isLoaded = true;
      update();
    } else {
      print(response.statusCode);
      print("data didnot recieved");
    }
  }
  // Future<void> getPopularProductList1() async {
  //   print('Calling');
  //   final response =
  //       await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/food/'));
  //   // final response =
  //   //     await http.get(Uri.parse('http://192.168.1.103:8000/api/v1/food/'));
  //   // print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print("Got the data");
  //     _popularProductList = [];
  //     _popularProductList
  //         .addAll(Products.fromJson(jsonDecode(response.body)[1]).products);
  //     _isLoaded = true;
  //     update();
  //   } else {
  //     print("unable to get the data");
  //   }
  // }

  void getQuantity(bool didinitialize) {
    if (didinitialize == true) {
      print("initialized");
      _quantity = checkQuantity(_quantity + 1);
    }
    if (didinitialize == false) {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  void inital(ProductMethod product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    bool exist = false;
    exist = _cart.isExisted(product);

    _inCartItem = _cart.getQuantity(product);
  }

  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Item Count", "You can't decrease more",
          backgroundColor: AppColors.maincolor, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      Get.snackbar("Item Count", "You can't add more",
          backgroundColor: AppColors.maincolor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
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
