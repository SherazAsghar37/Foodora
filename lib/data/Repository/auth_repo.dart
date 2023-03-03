import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../assets/app_constants.dart';
import '../api/api_client.dart';
import '../../methods/signup_body_model.dart';

class AuthRepo {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> register(SignupBody signupBody) async {
    return await apiClient.post(AppConstants.registerUri, signupBody.toJson());
  }

  saveToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.mainToken, token);
  }
}
