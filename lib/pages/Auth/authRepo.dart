import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/api_client.dart';

class AuthRepo {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
}
