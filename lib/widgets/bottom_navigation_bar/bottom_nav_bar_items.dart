import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';

class MyBottomNavBarItems {
  static  List<CurvedNavigationBarItem> bottomNavBarItems = [
    CurvedNavigationBarItem(
      child: Icon(
        Icons.home,
        color: MyColors.iconsColor,
      ),
      labelStyle: MyTextStyles.textStyle5,
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.video_collection_sharp,
        color: MyColors.iconsColor,
      ),
      labelStyle: MyTextStyles.textStyle5,
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.playlist_play_rounded,
        color: MyColors.iconsColor,
      ),
      labelStyle: MyTextStyles.textStyle5,
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.settings,
        color: MyColors.iconsColor,
      ),
      labelStyle: MyTextStyles.textStyle5,
    ),
  ];
}
