import 'package:first/data/Repository/CartRepo.dart';
import 'package:first/data/Repository/Popular_Reposiotry.dart';
import 'package:first/data/Repository/recommended_Repo.dart';
import 'package:first/data/api/api_client.dart';
import 'package:first/data/controller/popularController.dart';
import 'package:first/data/controller/recommenden_controller.dart';
import 'package:first/pages/Auth/authController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../assets/appConstants.dart';
import '../../pages/Auth/authRepo.dart';
import '../controller/CartController.dart';

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

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
