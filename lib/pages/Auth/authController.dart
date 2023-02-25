import 'package:first/pages/Auth/authRepo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  AuthRepo authRepo;
  AuthController({required this.authRepo});
}
