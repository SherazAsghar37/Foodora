import 'package:first/assets/app_constants.dart';
import 'package:first/data/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  UserRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> getUserData() async {
    print("Token " + apiClient.token);
    String token =
        await sharedPreferences.getString(AppConstants.mainToken).toString();
    print("Shared Preferences Token : " + token);
    return await apiClient.getData(AppConstants.user, newlytoken: token);
  }
}
