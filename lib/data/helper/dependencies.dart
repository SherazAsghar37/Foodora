
import 'package:first/assets/app_constants.dart';
import 'package:first/data/Repository/popular_reposiotry.dart';
import 'package:first/data/Repository/auth_repo.dart';
import 'package:first/data/Repository/cart_repo.dart';
import 'package:first/data/Repository/recommended_Repo.dart';
import 'package:first/data/api/api_client.dart';
import 'package:first/data/controller/cart_controller.dart';
import 'package:first/data/controller/popular_controller.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/data/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => PopularProductContr(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductContr(recommendedProductRepo: Get.find()));
}
