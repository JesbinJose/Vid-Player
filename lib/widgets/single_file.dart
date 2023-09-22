import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/screens/specific_videos.dart';
import 'package:play_video/utils/styles/styles.dart';

class SingleFileWidget extends StatefulWidget {
  const SingleFileWidget({super.key, required this.path});
  final String path;

  @override
  State<SingleFileWidget> createState() => _SingleFileWidgetState();
}

class _SingleFileWidgetState extends State<SingleFileWidget> {
  @override
  Widget build(BuildContext context) {
    //filtering all video to video in the same folder
    final List<String> neededPaths = Mydata.videoPaths
        .where((element) => element.startsWith(widget.path))
        .toList();
    //name of the root folder
    final String name = widget.path.split('/').last;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => SpecificVideoScreen(
            name: name,
            data: neededPaths,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Stack(
          children: [
            // showing the folder with name
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.folder,
                size: 140,
                color: MyColors.iconsColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 30,
                  child: name.length > 10
                      ? Marquee(
                        decelerationDuration: Duration.zero,
                        style: MyTextStyles.textStyle4,
                          blankSpace: 30,
                          velocity: 20,
                          text: name,
                          // text:
                        )
                      : Center(
                        child: Text(
                            name,
                            style: MyTextStyles.textStyle4,
                          ),
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
