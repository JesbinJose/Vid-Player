import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';

class MyCustomTextButtonChildForDialogeBox extends StatelessWidget {
  const MyCustomTextButtonChildForDialogeBox({super.key, required this.playlistName});
  final String playlistName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Center(
        child: Text(
          playlistName,
          style: MyTextStyles.textStyle5,
        ),
      ),
    );
  }
}
