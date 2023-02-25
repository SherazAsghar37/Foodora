import 'package:first/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../assets/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularUri);
  }
}
