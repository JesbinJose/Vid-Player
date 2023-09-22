import 'package:flutter/material.dart';
import 'package:play_video/hive/theme_color.dart';
import 'package:play_video/screens/main_screen.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/utils/styles/theme_set_up.dart';
import 'package:play_video/widgets/dialoge_box/theme_select_dialog.dart';

class AppThemeSettings extends StatefulWidget {
  const AppThemeSettings({super.key, required this.instance});
  final MainScreenState instance;
  @override
  State<AppThemeSettings> createState() => AppThemeSettingsState();
}

class AppThemeSettingsState extends State<AppThemeSettings> {
  @override
  void dispose() {
    super.dispose();
  }

  void refreh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(
                  defaultCurrentIndex: 3,
                ),
              ),
            );
          },
        ),
        title: Text(
          'App settings',
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          final String colorKey = SetTheme.colorType[index];
          return ListTile(
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: ThemeColorDB.getColor(
                  colorKey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            title: Text(
              colorKey,
              style: MyTextStyles.textStyle3,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ThemeColorSelectDialog(
                    colorKey: colorKey,
                    instance: this,
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 6,
      ),
    );
  }
}
