// import 'package:flutter/cupertino.dart';
import 'package:first/assets/dimensions.dart';
import '../assets/appColors.dart';
import '../assets/BigFont.dart';
import 'package:flutter/material.dart';
import 'page_body.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  @override
  Widget build(BuildContext context) {
    // print("app height is : "+MediaQuery.of(context).size.height.toString());
    // print("app width is : "+MediaQuery.of(context).size.width.toString());
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.fromLTRB(
                0, Dimensions.height45, 0, Dimensions.height20),
            padding: EdgeInsets.only(
                right: Dimensions.width10, left: Dimensions.width10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BigFont(
                          text: "Pakistan",
                          color: AppColors.maincolor,
                          size: Dimensions.height25,
                        ),
                        //SizedBox(height: 5,),
                        Row(
                          children: [
                            BigFont(
                              text: "locations",
                              color: Colors.black,
                              size: Dimensions.height15,
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              size: Dimensions.height25,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: Dimensions.height50,
                      width: Dimensions.height50,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.height30,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height15),
                          color: AppColors.maincolor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: PageBody(),
        ))
      ],
    ));
    //Main Container
  }
}
