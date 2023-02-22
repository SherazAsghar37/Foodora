import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/pages/Auth/loginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/dimensions.dart';
import '../../shortcuts/AppTextField.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  List iconsImages = ['fb.png', "google.png", 'twitter.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: Dimensions.height20,
            ),
            AppTextField(
              controller: NameController,
              icon: Icons.person,
              text: "Name",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              controller: PhoneController,
              icon: Icons.phone,
              text: "Phone",
            ),
            SizedBox(
              height: Dimensions.height20,
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
              height: Dimensions.height10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => LoginPage()),
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
                          backgroundImage:
                              AssetImage('images/${iconsImages[index]}'),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
