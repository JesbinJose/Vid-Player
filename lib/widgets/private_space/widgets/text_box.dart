import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class MyTextBoxForPrivateSpace extends StatefulWidget {
  const MyTextBoxForPrivateSpace({super.key, required this.controller, this.text});
  final TextEditingController controller;
  final String? text;
  @override
  State<MyTextBoxForPrivateSpace> createState() =>
      _MyTextBoxForPrivateSpaceState();
}

class _MyTextBoxForPrivateSpaceState extends State<MyTextBoxForPrivateSpace> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.text??'Password',
        hintStyle: MyTextStyles.textStyle4,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide:  BorderSide(color: MyColors.iconsColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide:  BorderSide(color: MyColors.primaryColor),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // ignore: dead_code
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: MyColors.primaryColor,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
