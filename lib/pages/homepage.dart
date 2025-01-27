import 'package:first/assets/app_colors.dart';
import 'package:first/pages/cart/cart_history_page.dart';
import 'package:first/pages/main_app_page.dart';
import 'package:first/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'Auth/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // var pages = [
  //   MainAppPage(),
  //   Container(
  //     child: Center(
  //       child: Text("page 1"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("page 2"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("page 3"),
  //     ),
  //   ),
  // ];
  // var selectedIndex = 0;
  // void onTapNav(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

//internet:
  List<Widget> _buildScreens() {
    return [
      const MainAppPage(),
      Center(
          child: Container(
        child: const Text("Empty Container"),
      )),
      const CartHistory(),
      const ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        // ignore: prefer_const_constructors
        icon: Icon(CupertinoIcons.archivebox),
        title: ("Archieve"),
        activeColorPrimary: AppColors.maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.shopping_cart),
        title: ("Cart History"),
        activeColorPrimary: AppColors.maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  //own code:
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //         selectedItemColor: AppColors.maincolor,
  //         unselectedItemColor: AppColors.smalltextcolor,
  //         selectedFontSize: 0,
  //         unselectedFontSize: 0,
  //         showSelectedLabels: false,
  //         showUnselectedLabels: false,
  //         currentIndex: selectedIndex,
  //         onTap: onTapNav,
  //         items: [
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.home_outlined),
  //             label: "Home Page",
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.archive_outlined),
  //             label: "Archieve Page",
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart_outlined),
  //             label: "Cart Page",
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.person_outline),
  //             label: "Profile Page",
  //           ),
  //         ]),
  //   );
  // }
  //internet:
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
