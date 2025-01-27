import 'package:first/assets/app_colors.dart';
import 'package:first/data/controller/user_controller.dart';
import 'package:first/methods/signup_body_model.dart';
import 'package:first/assets/validation_helper.dart';
import 'package:first/pages/Auth/login_page.dart';
import 'package:first/route_helper/route_helper.dart';
import 'package:first/shortcuts/custom_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/big_font.dart';
import '../../assets/dimensions.dart';
import '../../data/controller/auth_controller.dart';
import '../../shortcuts/app_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List iconsImages = ['fb.png', "google.png", 'twitter.png'];
  late String email;
  late String name;
  late String phone;
  late String password;
  @override
  Widget build(BuildContext context) {
    setFields() {
      email = emailController.text.trim();
      password = passwordController.text.trim();
      name = nameController.text.trim();
      phone = phoneController.text.trim();
    }

    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: AppColors.appWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: authController.isLoading
              ? const Center(child: CustomLoader())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    Container(
                      height: Dimensions.height120,
                      width: Dimensions.width120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Logo.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      controller: emailController,
                      icon: Icons.mail,
                      text: "Email",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      controller: passwordController,
                      icon: Icons.password,
                      isObscure: true,
                      text: "Password",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      controller: nameController,
                      icon: Icons.person,
                      text: "Name",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      controller: phoneController,
                      icon: Icons.phone,
                      text: "Phone",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setFields();
                        print(email + password + name + phone);
                        VAlidationHelper.validationHelper(
                            email, password, name, phone);
                        var signupBody = SignupBody(
                            email: email,
                            name: name,
                            password: password,
                            phone: phone);
                        authController.registeration(signupBody).then((status) {
                          if (status.isSucess) {
                            ("Sucessful Registration");
                            Get.find<UserController>().getUserInfo();
                            Get.toNamed(RouteHelper.getInital());
                          } else {
                            VAlidationHelper.getAppSnackbar(status.message);
                          }
                        });
                      },
                      child: Container(
                        height: Dimensions.screenHeight / 13,
                        width: Dimensions.screenWidth / 2,
                        padding: EdgeInsets.all(Dimensions.height10),
                        decoration: BoxDecoration(
                            color: AppColors.maincolor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.height30)),
                        child: Center(
                          child: BigFont(
                            text: "Sign up",
                            color: Colors.white,
                            size: Dimensions.height30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => const LoginPage()),
                            text: "Already have an Account?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.height20))),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Signup using one of following methods",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.height17))),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.all(Dimensions.height10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: Dimensions.height30,
                                  backgroundImage: AssetImage(
                                      'images/${iconsImages[index]}'),
                                ),
                              )),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
