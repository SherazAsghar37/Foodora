import 'package:first/assets/AppRoundIcon.dart';
import 'package:first/assets/BigFont.dart';
import 'package:first/assets/appColors.dart';
import 'package:first/assets/appConstants.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

import '../shortcuts/profileCotainer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  'images/luffy.png',
                ),
                radius: Dimensions.height70 + Dimensions.height10,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: AppRoundIcons(
                    color: Colors.white,
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
            text: "Luffy",
            color: Colors.black,
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
                    Text: "Luffy",
                    icon: Icons.person,
                  ),
                  ProfileContainer(
                    Text: "+92 3010175200",
                    icon: Icons.phone,
                  ),
                  ProfileContainer(
                    Text: "Luffy@gmail.com",
                    icon: Icons.mail,
                  ),
                  ProfileContainer(
                    Text: "Korangi, Karachi",
                    icon: Icons.location_on_outlined,
                  ),
                  ProfileContainer(
                    Text: "Message Here",
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
