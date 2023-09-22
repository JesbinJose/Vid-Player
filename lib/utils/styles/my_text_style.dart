import 'package:flutter/material.dart';

class MyTextStyles {
 
  static changeTextColor(Color givenColor) {
    textStyle1 = textStyle1.copyWith(color: givenColor);
    textStyle2 = textStyle2.copyWith(color: givenColor);
    textStyle3 = textStyle3.copyWith(color: givenColor);
    textStyle4 = textStyle4.copyWith(color: givenColor);
    textStyle5 = textStyle5.copyWith(color: givenColor);
  }

  static TextStyle textStyle1 =const TextStyle(
    fontSize: 26,
    fontFamily: "LibreBaskerville",
    fontWeight: FontWeight.w900,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle textStyle2 =const TextStyle(
    fontSize: 20,
    fontFamily: "LibreBaskerville",
    fontWeight: FontWeight.w800,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle textStyle3 =const TextStyle(
    fontSize: 18,
    fontFamily: "LibreBaskerville",
    fontWeight: FontWeight.w900,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle textStyle4 =const TextStyle(
    fontSize: 13,
    fontFamily: "LibreBaskerville",
    fontWeight: FontWeight.w800,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle textStyle5 =const TextStyle(
    fontFamily: "LibreBaskerville",
    fontWeight: FontWeight.w500,
    fontSize: 15,
    overflow: TextOverflow.ellipsis,
  );
}
