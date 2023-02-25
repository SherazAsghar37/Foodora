import 'dart:async';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/controller/cart_controller.dart';
import '../data/controller/popular_controller.dart';
import '../data/controller/recommenden_controller.dart';
import '../route_helper/routeHelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  _loadresources() {
    Get.find<PopularProductContr>().getPopularProductList();
    Get.find<RecommendedProductContr>().getRecommendedProductList();
    // Get.find<PopularProductContr>().getPopularProductList1();
    // Get.find<RecommendedProductContr>().getRecommendedProductList1();
    Get.find<CartController>;
  }

  @override
  void initState() {
    super.initState();
    _loadresources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInital()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: animation,
          child: Image(
            image: const AssetImage("images/Splash-Logo.png"),
            width: Dimensions.splashscreenWidth,
          ),
        )
      ],
    ));
  }
}
