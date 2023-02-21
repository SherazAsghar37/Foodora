import 'package:first/assets/appColors.dart';
import 'package:first/assets/dimensions.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.maincolor,
            backgroundImage: AssetImage('images/luffy.png'),
            radius: Dimensions.height50,
          )
        ],
      ),
    );
  }
}
