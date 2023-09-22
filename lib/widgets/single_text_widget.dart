import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class MySingletextWidget extends StatelessWidget {
  const MySingletextWidget({
    super.key,
    required this.content,
    this.isTitle,
  });
  final String content;
  final bool? isTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: isTitle!=false?10:5),
      child: Text(
        content,
        textAlign: TextAlign.justify,
        style: isTitle == true
            ? MyTextStyles.textStyle2.copyWith(
                overflow: TextOverflow.visible,
              )
            : isTitle !=null
                ? MyTextStyles.textStyle5.copyWith(
                    overflow: TextOverflow.visible,
                  )
                : MyTextStyles.textStyle4.copyWith(
                    overflow: TextOverflow.visible,
                    
                  ),
      ),
    );
  }
}
