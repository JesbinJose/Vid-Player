import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:play_video/hive/theme_color.dart';
import 'package:play_video/screens/settings/theme_settings.dart';
import 'package:play_video/utils/styles/default_color.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class ThemeColorSelectDialog extends StatelessWidget {
  const ThemeColorSelectDialog({
    super.key,
    required this.colorKey,
    required this.instance,
  });
  final String colorKey;
  final AppThemeSettingsState instance;
  @override
  Widget build(BuildContext context) {
    Color selectedColor = ThemeColorDB.getColor(
      colorKey,
    );
    return SimpleDialog(
      title: const Text('Select Color'),
      children: [
        HueRingPicker(
          pickerColor: selectedColor,
          onColorChanged: (color) {
            selectedColor = color;
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  onPressed: () async {
                    selectedColor =
                        MyDefaultColors.defaultColorCombo[colorKey]!;
                    Navigator.pop(context);
                    await ThemeColorDB.changeColor(
                      colorKey,
                      selectedColor,
                    );
                    ThemeColorDB.refreshColor();
                    MyTextStyles.changeTextColor(MyColors.textColor);
                    instance.refreh();
                  },
                  child: const Text('default'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await ThemeColorDB.changeColor(
                      colorKey,
                      selectedColor,
                    );
                    ThemeColorDB.refreshColor();
                      MyTextStyles.changeTextColor(MyColors.textColor);
                    instance.refreh();
                  },
                  child: const Text('Set Color'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
