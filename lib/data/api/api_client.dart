import 'package:get/get.dart';
import '../../assets/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainheader;
  late Map<String, String> _mainGetheader;
  ApiClient({required this.appBaseUrl}) {
    timeout = const Duration(seconds: 30);
    baseUrl = appBaseUrl;
    token = AppConstants.mainToken;
    _mainheader = {
      'Accept': 'application/json',
      'Authorization': 'token $token'
    };
    _mainGetheader = {
      'Accept': 'application/json',
      'Authorization': 'token 33586a549763d0710aaf6bfd8a57fd87b061ae13'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainheader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response responses = await post(uri, body, headers: _mainheader);
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
