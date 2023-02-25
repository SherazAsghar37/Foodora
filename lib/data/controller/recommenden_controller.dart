import 'package:first/data/Repository/recommended_Repo.dart';
import 'package:first/methods/Product_methods.dart';
import 'package:get/get.dart';

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
      _recommendedProductList
          .addAll(Products.fromJson(response.body[0]).products);
      _isLoaded = true;
      update();
    } else {
      print("unable to get the data");
    }
  }

//   Future<void> getRecommendedProductList1() async {
//     print('Calling');
//     final response =
//         await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/food/'));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       print("Got the data");
//       _recommendedProductList = [];
//       _recommendedProductList
//           .addAll(Products.fromJson(jsonDecode(response.body)[0]).products);
//       _isLoaded = true;
//       update();
//     } else {
//       print("unable to get the data");
//     }
//   }
}
