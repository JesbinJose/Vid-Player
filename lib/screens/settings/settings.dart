import 'package:flutter/material.dart';
import 'package:play_video/screens/main_screen.dart';
import 'package:play_video/screens/settings/about_us.dart';
import 'package:play_video/screens/settings/theme_settings.dart';
import 'package:play_video/screens/settings/privacy_policy.dart';
import 'package:play_video/screens/settings/private_space_password.dart';
import 'package:play_video/screens/fav_display.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/settings/settings_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.instace});
  final MainScreenState instace;
  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title:  Text(
          'Settings',
          style: MyTextStyles.textStyle2,
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          //settings body
          const SettingsEachListTile(
            title: 'Private space',
            screen: PrivateSpacePasswordScreen(),
            icon: Icons.lock,
          ),
          const Divider(),
          SettingsEachListTile(
            title: 'App Theme',
            screen: AppThemeSettings(
              instance: widget.instace,
            ),
            icon: Icons.color_lens,
          ),
          const Divider(),
          const SettingsEachListTile(
            title: 'About us',
            screen: AboutUsScreen(),
            icon: Icons.person,
          ),
          const Divider(),
          const SettingsEachListTile(
            title: 'Privacy policy',
            screen: PrivacyPolicyScreen(),
            icon: Icons.privacy_tip_outlined,
          ),
          const Divider(),
          const SettingsEachListTile(
            title: 'Favourite',
            screen: FavoriteVideoScreen(),
            icon: Icons.favorite,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
