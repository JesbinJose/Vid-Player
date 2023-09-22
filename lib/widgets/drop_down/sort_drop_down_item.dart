import 'package:flutter/material.dart';
import 'package:play_video/screens/videos.dart';
import 'package:play_video/utils/styles/styles.dart';

class MyDropDownItem  {
  const MyDropDownItem({
    required this.instance,
    required this.title,
    required this.asec,
    required this.function,
  });
  final VideosScreenState instance;
  final String title;
  final bool asec;
  final Function function;

  PopupMenuItem<String> build() {
    return PopupMenuItem<String>(
      child: Row(
        children: [
          Text(
            title,
            style: MyTextStyles.textStyle4,
          ),
          Icon(
            asec ? Icons.arrow_downward : Icons.arrow_upward,
            color: MyColors.iconsColor,
          ),
        ],
      ),
      onTap: () {
        function;
        instance.refresh();
      },
    );
  }
}
