import 'package:get/get.dart';
import '../../assets/appConstants.dart';
class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainheader;
  ApiClient({required this.appBaseUrl}) {
    timeout = Duration(seconds: 30);
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    _mainheader = {
      'Connect-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {

    try {
      Response response = await get(uri);
      return response;
    } catch (e){
      return await Response(statusCode: 1, statusText: e.toString());
      
    }
  }
}
