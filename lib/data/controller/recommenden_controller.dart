import 'package:first/data/Repository/recommended_Repo.dart';
import 'package:first/methods/Product_methods.dart';
import 'package:get/get.dart';
import '../Repository/recommended_Repo.dart';

class RecommendedProductContr extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductContr({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("Got the data");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Products.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("unable to get the data");
    }
  }
}
