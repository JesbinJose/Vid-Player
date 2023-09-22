import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_video/utils/styles/default_color.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/utils/styles/theme_set_up.dart';

class ThemeColorDB {
  static late Box box;
  static Future<void> loadDB() async {
    box = await Hive.openBox('theme_color_db');
    if (box.keys.isEmpty) {
      for (final String color in SetTheme.colorType) {
        await box.put(color, MyDefaultColors.defaultColorCombo[color]!.value);
      }
    } else {
      List<String> keys = SetTheme.colorType;
      MyColors.primaryColor = Color(box.get(keys[0]));
      MyColors.secondaryColor = Color(box.get(keys[1]));
      MyColors.backgroundColor = Color(box.get(keys[2]));
      MyColors.textColor = Color(box.get(keys[3]));
      MyColors.iconsColor = Color(box.get(keys[4]));
      MyColors.primaryLightColor = Color(box.get(keys[5]));
    }
  }

  static refreshColor() {
    List<String> keys = SetTheme.colorType;
    MyColors.primaryColor = Color(box.get(keys[0]));
    MyColors.secondaryColor = Color(box.get(keys[1]));
    MyColors.backgroundColor = Color(box.get(keys[2]));
    MyColors.textColor = Color(box.get(keys[3]));
    MyColors.iconsColor = Color(box.get(keys[4]));
    MyColors.primaryLightColor = Color(box.get(keys[5]));
  }

  static int getColorCount() {
    return box.keys.length;
  }

  static Color getColor(String key) {
    return Color(box.get(key));
  }

  static Future<void> changeColor(String key, Color color) async {
    await box.put(key, color.value);
  }
}
