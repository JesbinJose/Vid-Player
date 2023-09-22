import 'package:flutter/material.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';

import '../utils/styles/styles.dart';

class VideoScreenRandom extends StatefulWidget {
  const VideoScreenRandom({
    super.key,
    required this.title,
    required this.paths,
  });
  final String title;
  final List<String> paths;

  @override
  State<VideoScreenRandom> createState() => VideoScreenRandomState();
}

class VideoScreenRandomState extends State<VideoScreenRandom> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: MyTextStyles.textStyle2,
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.paths.length,
        itemBuilder: (context, index) => VideoSingleWidget(
          videoPaths: widget.paths,
          index: index,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
