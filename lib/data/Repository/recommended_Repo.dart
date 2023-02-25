import 'package:first/assets/app_constants.dart';
import 'package:first/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedUri);
  }
}
