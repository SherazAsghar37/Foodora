import 'package:first/data/Repository/user_repo.dart';
import 'package:first/methods/resposne_model.dart';
import 'package:first/methods/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  UserRepo userRepo;
  UserController({required this.userRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late UserModel _userModel;
  UserModel get userModel => _userModel;
  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    update();
    Response response = await userRepo.getUserData();
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      print("Getting user data");
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel(true, "Sucessful");
    } else {
      print('Unable to get user data');
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
