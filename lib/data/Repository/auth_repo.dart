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

  Future<Response> login(String email, String password) async {
    return await apiClient
        .post(AppConstants.signinUri, {'email': email, 'password': password});
  }

  Future<bool> saveToken(String newtoken) async {
    apiClient.token = newtoken;
    apiClient.updateHeader(newtoken);
    return await sharedPreferences.setString(AppConstants.mainToken, newtoken);
  }

  Future<void> saveUsernamePassword(String phone, String password) async {
    await sharedPreferences.setString(AppConstants.phone, phone);
    await sharedPreferences.setString(AppConstants.password, password);
  }

  bool isLoggedin() {
    return sharedPreferences.containsKey(AppConstants.mainToken);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.mainToken);
    sharedPreferences.remove(AppConstants.password);
    sharedPreferences.remove(AppConstants.phone);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
