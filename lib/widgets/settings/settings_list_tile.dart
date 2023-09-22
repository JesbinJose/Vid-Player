import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';

class SettingsEachListTile extends StatelessWidget {
  const SettingsEachListTile({
    super.key,
    required this.title,
    required this.screen,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: MyTextStyles.textStyle4,
      ),
      leading: Icon(icon),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          //navigate according to given widget
          builder: (context) => screen,
        ),
      ),
    );
  }
}
