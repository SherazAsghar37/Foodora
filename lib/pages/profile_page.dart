import 'package:first/assets/app_round_icon.dart';
import 'package:first/assets/big_font.dart';
import 'package:first/data/controller/auth_controller.dart';
import 'package:first/data/controller/cart_controller.dart';
import 'package:first/data/controller/user_controller.dart';
import 'package:first/route_helper/route_helper.dart';
import 'package:first/shortcuts/custom_loader.dart';
import 'package:get/get.dart';
import '../../assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

import '../shortcuts/profile_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedin = Get.find<AuthController>().isLoggedin();
    // if (isLoggedin) {
    //   Get.find<UserController>().getUserInfo();
    // }
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return isLoggedin
            ? (userController.isLoading
                ? const CustomLoader()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.find<UserController>().getUserInfo(),
                        child: CircleAvatar(
                          radius: Dimensions.height70 + Dimensions.height15,
                          backgroundColor: AppColors.maincolor,
                          child: CircleAvatar(
                              backgroundColor: AppColors.maincolor,
                              backgroundImage: const AssetImage(
                                'images/luffy.jpg',
                              ),
                              radius: Dimensions.height70 + Dimensions.height10,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: AppRoundIcons(
                                  color: AppColors.appWhite,
                                  icon: Icons.add,
                                  backColor: AppColors.maincolor,
                                  length: Dimensions.height25,
                                  iconsize: Dimensions.height22,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      BigFont(
                        text: userController.userModel.name,
                        color: AppColors.appBlack,
                        size: Dimensions.font25,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ProfileContainer(
                                text: userController.userModel.name,
                                icon: Icons.person,
                              ),
                              ProfileContainer(
                                text: userController.userModel.phone,
                                icon: Icons.phone,
                              ),
                              ProfileContainer(
                                text: userController.userModel.email,
                                icon: Icons.mail,
                              ),
                              ProfileContainer(
                                text: "Konoha, Karachi",
                                icon: Icons.location_on_outlined,
                              ),
                              ProfileContainer(
                                text: "Message Here",
                                icon: Icons.message_outlined,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>().isLoggedin()) {
                                    Get.find<AuthController>()
                                        .clearSharedData();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.offNamed(RouteHelper.initial);
                                  }
                                },
                                child: ProfileContainer(
                                  text: "logout",
                                  icon: Icons.logout_outlined,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.screenHeight / 2,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/signin.jpg')),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.signinPage),
                    child: Container(
                      height: Dimensions.height70,
                      width: Dimensions.width120 + Dimensions.width20,
                      decoration: BoxDecoration(
                        color: AppColors.maincolor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height15),
                      ),
                      child: Center(
                        child: BigFont(
                          text: "Signin",
                          color: AppColors.appWhite,
                          size: Dimensions.height30,
                        ),
                      ),
                    ),
                  )
                ],
              );
      }),
    );
  }
}
