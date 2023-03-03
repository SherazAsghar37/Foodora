import 'package:first/pages/Auth/login_page.dart';
import 'package:first/pages/cart/cart_page.dart';
import 'package:first/pages/detail_page.dart';
import 'package:first/pages/homepage.dart';
import 'package:first/pages/recepie_page.dart';
import 'package:get/get.dart';
import '../splash/splash_Screen.dart';

class RouteHelper {
  static const initial = '/';
  static const splashPage = '/splash-page';
  static const popularFoodPage = '/popualar-food-page';
  static const recommendedFoodPage = '/recommended-food-page';
  static const cartPage = '/cart-Page';
  static const signinPage = '/signin-Page';

  static String getSplashPage() => splashPage;
  static String getInital() => initial;
  static String getCartpage(String page) => '$cartPage?page=$page';
  static String getPopularFoodPage(int pageId, String page) =>
      '$popularFoodPage?pageId=$pageId&page = $page';
  static String getRecommendedFoodPage(int recPageId, String page) =>
      "$recommendedFoodPage?recPageId=$recPageId&page=$page";
  static String getSigninPage() => signinPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: signinPage, page: () => const LoginPage()),
    GetPage(
      name: initial,
      page: () => const HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: popularFoodPage,
        page: () {
          String pageId = Get.parameters['pageId'].toString();
          String page = Get.parameters['page'].toString();
          return Detailpage(
            pageId: int.parse(pageId),
            page: page,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFoodPage,
        page: () {
          String recPageId = Get.parameters['recPageId'].toString();
          String page = Get.parameters['page'].toString();
          return RecepiePage(
            recPageId: int.parse(recPageId),
            page: page,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          String page = Get.parameters['page'].toString();
          return CartPage(
            page: page,
          );
        },
        transition: Transition.fadeIn)
  ];
}
