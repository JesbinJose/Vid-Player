import 'package:flutter/material.dart';
import 'package:play_video/data/video_metadata.dart';

class ShowTimeOfVideo extends StatelessWidget {
  const ShowTimeOfVideo({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VideoMetaData.getTime(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              snapshot.data ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
