import 'package:first/assets/appConstants.dart';
import 'package:first/data/controller/CartController.dart';
import 'package:first/data/controller/popularController.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/route_helper/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first/data/helper/Dependencied.dart' as dep;

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
              title: AppConstants.APP_NAME,
              // home: splashScreen(),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes);
        });
      });
    });
  }
}