import 'package:first/data/Repository/authRepo.dart';
import 'package:first/methods/resposneModel.dart';
import 'package:get/get.dart';

import '../../methods/Signup_body_moel.dart';

class AuthController extends GetxController implements GetxService {
  AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<ResponseModel> Registeration(SignupBody signupBody) async {
    _isLoading = true;
    Response response = await authRepo.Register(signupBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.SaveToken(response.body['Token']);
      responseModel = ResponseModel(true, response.body['Token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    return responseModel;
  }
}
