import 'dart:async';
import 'package:first/assets/dimensions.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/controller/popularController.dart';
import '../data/controller/recommenden_controller.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  _loadresources() {
    // Get.find<PopularProductContr>().getPopularProductList();

    // Get.find<RecommendedProductContr>().getRecommendedProductList();
    Get.find<RecommendedProductContr>().getRecommendedProductList1();
    Get.find<CartController>;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadresources();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInital()));
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
            image: AssetImage("images/Splash-Logo.png"),
            width: Dimensions.SplashScreenWidth,
          ),
        )
      ],
    ));
  }
}
