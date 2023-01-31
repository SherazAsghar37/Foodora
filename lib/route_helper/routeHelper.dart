import 'package:first/pages/cart/cartPage.dart';
import 'package:first/pages/detailpage.dart';
import 'package:first/pages/homepage.dart';
import 'package:first/pages/main_app_page.dart';
import 'package:first/pages/recepiePage.dart';
import 'package:first/splash/splash_Screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = '/';
  static const splashPage = '/splash-page';
  static const popularFoodPage = '/popualar-food-page';
  static const recommendedFoodPage = '/recommended-food-page';
  static const cartPage = '/cart-Page';

  static String getSplashPage() => '$splashPage';
  static String getInital() => '$initial';
  static String getCartpage() => '$cartPage';
  static String getPopularFoodPage(int PageId, String page) =>
      '$popularFoodPage?pageId=$PageId&page = $page';
  static String getRecommendedFoodPage(int RecPageId, String page) =>
      "$recommendedFoodPage?RecPageId=$RecPageId&page=$page";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => splashScreen()),
    GetPage(
      name: initial,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: popularFoodPage,
        page: () {
          var pageId = Get.parameters['pageId'].toString();
          String Page = Get.parameters['page'].toString();
          int pageID = int.parse(pageId);
          return Detailpage(
            PageId: pageID,
            page: Page,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFoodPage,
        page: () {
          var RecPageId = Get.parameters['RecPageId'];
          String page = Get.parameters['page'].toString();
          return RecepiePage(
            RecPageId: int.parse(RecPageId!),
            page: page,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
