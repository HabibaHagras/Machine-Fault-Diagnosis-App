// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/Home.dart';
import 'package:flutter_application_2/FetchUserData/views/account/accountscreen.dart';
import 'package:flutter_application_2/record.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class navy extends StatelessWidget {
  int h;
  navy({
   this.h=0,
  }) ;

late PersistentTabController _controller = PersistentTabController(initialIndex:h);

  List<Widget> _buildScreens() {
        return [
          rHome(),
          // Record(),
          // recordScreen(),
          recordScreen(),
          rAccount()

        ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
              
                icon: Icon(CupertinoIcons.home),
                
                activeColorPrimary: rBasicColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            
          
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.mic),
                activeColorPrimary: rBasicColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              
                icon: Icon(CupertinoIcons.person_fill),
                activeColorPrimary: rBasicColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            
        ];
  }

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
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3
         // Choose the nav bar style with this property.
    );
    
  
  
  
  }
}
