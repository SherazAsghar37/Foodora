import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/smallFont.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/dimensions.dart';
import '../../shortcuts/AppTextField.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.Screenheight * 0.05,
            ),
            Container(
              height: Dimensions.height120,
              width: Dimensions.width120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Logo.png'), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width30),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height10 * 7),
                  ),
                  ThinFont(
                    text: "Sign into your account",
                    color: Colors.grey[500]!,
                    size: Dimensions.height20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              controller: EmailController,
              icon: Icons.mail,
              text: "Email",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              controller: PasswordController,
              icon: Icons.password,
              text: "Password",
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width30),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back,
                          text: "Signin to your Account",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.height20))),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              height: Dimensions.Screenheight / 13,
              width: Dimensions.Screenwidth / 2,
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                  color: AppColors.maincolor,
                  borderRadius: BorderRadius.circular(Dimensions.height30)),
              child: Center(
                child: BigFont(
                  text: "Sign up",
                  color: Colors.white,
                  size: Dimensions.height30,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.Screenheight * 0.05,
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an Account?",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.height20),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignupPage(),
                              transition: Transition.fadeIn),
                        text: " Create",
                        style: TextStyle(
                          fontSize: Dimensions.height20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
