import 'package:flutter/material.dart';
import 'package:play_video/utils/private_space/move_video_to_temp.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';

class PrivateSpaceDeleteVideoDialog extends StatelessWidget {
  final String path;
  final PrivateSpaceShowVideoScreenState intance;
  const PrivateSpaceDeleteVideoDialog(
      {super.key, required this.path, required this.intance});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        'Do you want to remove the video from the private space',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () async {
            await MoveVideo.unHideVideo(path).then((value) {
              intance.videoPaths.remove(path);
              intance.refresh();
              Navigator.pop(context);
            });
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
