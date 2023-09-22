import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class MyDropDownItem {
  static DropdownMenuItem dropDownitem({
    required String title,
    required IconData icon,
    required Function function,
  }) {
    return DropdownMenuItem(
      onTap: () => function,
      child: Row(
        children: [
          Text(
            '$title  ',
            style: MyTextStyles.textStyle4,
          ),
          Icon(
            icon,
            color: MyColors.iconsColor,
          ),
        ],
      ),
    );
  }
}
