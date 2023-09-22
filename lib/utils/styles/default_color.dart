import 'package:flutter/material.dart';

class MyDefaultColors {
  static Map<String,Color> defaultColorCombo={
    'PrimaryColor':_primaryColor,
    'SecondaryColor':_secondaryColor,
    'BackgroundColor':_backgroundColor,
    'TextColor':_textColor,
    'IconsColor':_iconsColor,
    'PrimaryLightColor':_primaryLightColor,
  };
  static const Color _primaryColor = Color(0xff48cae4);
  static const Color _secondaryColor = Color(0xff023e8a);
  static const Color _backgroundColor = Color(0xffcaf0f8);
  static const Color _textColor = Color(0xff023e8a);
  static const Color _iconsColor = Color(0xff0077b6);
  static const Color _primaryLightColor = Color.fromARGB(255, 157, 221, 255);
}