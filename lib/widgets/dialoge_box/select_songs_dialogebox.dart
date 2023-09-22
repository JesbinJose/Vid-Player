import 'package:flutter/material.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/utils/styles/my_color_style.dart';

class SelectSongsDialogeBox extends StatelessWidget {
  const SelectSongsDialogeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.backgroundColor,
      child: SizedBox(
        height: 300,
        width: 250,
        child: ListView.separated(
          itemBuilder: (context, index) => const Divider(),
          separatorBuilder: (context, index) {
            bool isVideoSelected = false;
            return ListTile(
              leading: Checkbox(
                onChanged: (value) {},
                value: isVideoSelected,
              ),
              title: Text(
                Mydata.videoPaths[index],
              ),
            );
          },
          itemCount: Mydata.videoPaths.length,
        ),
      ),
    );
  }
}
