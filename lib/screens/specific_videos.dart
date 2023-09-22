import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';

class SpecificVideoScreen extends StatelessWidget {
  const SpecificVideoScreen(
      {super.key, required this.name, required this.data});
  final String name;
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          name,
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => VideoSingleWidget(
            videoPaths: data,
            index: index,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          ),
        ),
      ),
    );
  }
}
