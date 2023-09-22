import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:play_video/screens/main_screen.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/bottom_navigation_bar/bottom_nav_bar_items.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({
    super.key,
    required this.index,
    required this.instance,
  });
  final int index;
  final MainScreenState instance;

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      animationCurve: Curves.ease,
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      color: MyColors.primaryColor,
      index: widget.index,
      items: [
        //all item in nav bar
        ...List.generate(
          MyBottomNavBarItems.bottomNavBarItems.length,
          (index) => MyBottomNavBarItems.bottomNavBarItems[index],
        ),
      ],
      onTap: (value) {
        if (value != widget.index) {
          MainScreenState.currentIndex = value;
          widget.instance.refresh();
        }
      },
    );
  }
}
