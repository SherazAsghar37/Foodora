import 'package:first/assets/app_round_icon.dart';
import 'package:first/assets/Big_font.dart';
import '../../assets/app_colors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

import '../shortcuts/profile_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
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
          SizedBox(
            height: Dimensions.height10,
          ),
          BigFont(
            text: "Naruto",
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
                    text: "Naruto Uzumaki",
                    icon: Icons.person,
                  ),
                  ProfileContainer(
                    text: "+92 3010175200",
                    icon: Icons.phone,
                  ),
                  ProfileContainer(
                    text: "sasuke@gmail.com",
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
