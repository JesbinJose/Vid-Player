import 'package:flutter/material.dart';
import 'package:play_video/screens/home.dart';
import 'package:play_video/screens/playlists.dart';
import 'package:play_video/screens/settings/settings.dart';
import 'package:play_video/screens/videos.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/widgets/bottom_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.defaultCurrentIndex = 0});
  final int defaultCurrentIndex;

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  void refresh() {
    setState(() {});
  }

  static int currentIndex=0;
  @override
  void initState() {
    currentIndex = widget.defaultCurrentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const VideosScreen(),
      const PlaylistsScreen(),
      SettingsScreen(
        instace: this,
      ),
    ];
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            screens[currentIndex],
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: MyNavbar(
                  index: currentIndex,
                  instance: this,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
