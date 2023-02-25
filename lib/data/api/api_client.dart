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
      'Accept': 'application/json',
      'Authorization': 'token $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      print(uri);
      Response response = await get(uri, headers: _mainheader);
      return response;
    } catch (e) {
      return await Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print("body : " + body.toString());
    try {
      print("uri : " + uri.toString());
      Response responses = await post(uri, body, headers: _mainheader);
      print("response : " + responses.toString());
      return responses;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  updateHeader(String token) {
    _mainheader = {
      'Accept': 'application/json',
      'Authorization': 'token $token'
    };
  }
}
