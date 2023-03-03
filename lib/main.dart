import 'package:first/assets/app_constants.dart';
import 'package:first/data/controller/popular_controller.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/pages/Auth/login_page.dart';
import 'package:first/pages/Auth/signup_page.dart';
import 'package:first/route_helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first/data/helper/dependencies.dart' as dep;

import 'data/controller/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductContr>(builder: (_) {
      return GetBuilder<RecommendedProductContr>(builder: (_) {
        return GetBuilder<CartController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            // home: LoginPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      });
    });
  }
}
