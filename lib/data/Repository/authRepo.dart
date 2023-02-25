import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../assets/appConstants.dart';
import '../api/api_client.dart';
import '../../methods/Signup_body_moel.dart';

class AuthRepo {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> Register(SignupBody signupBody) async {
    return await apiClient.post(AppConstants.Register_URI, signupBody.toJson());
  }

  SaveToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
