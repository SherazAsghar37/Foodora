import 'package:first/methods/resposne_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../methods/signup_body_model.dart';
import '../Repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<ResponseModel> registeration(SignupBody signupBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.register(signupBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveToken(response.body['Token']);
      responseModel = ResponseModel(true, response.body['Token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveToken(response.body['Token']);
      responseModel = ResponseModel(true, response.body['Token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUsernamePassword(String phone, String password) {
    authRepo.saveUsernamePassword(phone, password);
  }

  bool isLoggedin() {
    return authRepo.isLoggedin();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
