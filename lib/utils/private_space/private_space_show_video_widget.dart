import 'package:flutter/material.dart';
import 'package:play_video/screens/play_video_screen.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';
import 'package:play_video/utils/styles/my_text_style.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_video_thumbnail.dart';

class PrivateSpaceShowThumbnail extends StatefulWidget {
  const PrivateSpaceShowThumbnail(
      {super.key, required this.hiddenPaths, required this.instance});
  final List<String> hiddenPaths;
  final PrivateSpaceShowVideoScreenState instance;
  @override
  State<PrivateSpaceShowThumbnail> createState() =>
      _PrivateSpaceShowThumbnailState();
}

class _PrivateSpaceShowThumbnailState extends State<PrivateSpaceShowThumbnail> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.hiddenPaths.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayVideoScreen(
                isFullScren: true,
                isPrivateSpace: true,
                path: widget.hiddenPaths[index],
                videoPaths: widget.hiddenPaths,
              ),
            ),
          );
        },
        child: Column(
          children: [
            MainVideoThumbnailPart(
              privateSpaceInstace: widget.instance,
              isPrivateSpace: true,
              path: widget.hiddenPaths[index],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                //getting name form the path
                widget.hiddenPaths[index].split('/').last,
                style: MyTextStyles.textStyle5,
              ),
            ),
          ],
        ),
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
    );
  }
}
