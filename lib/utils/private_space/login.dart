import 'package:flutter/material.dart';
import 'package:play_video/hive/private_space_db.dart';
import 'package:play_video/utils/private_space/move_video_to_temp.dart';
import 'package:play_video/utils/private_space/private_space_shared_pref.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';
import 'package:play_video/widgets/private_space/widgets/text_box.dart';

class PrivateSpaceLogin extends StatelessWidget {
  const PrivateSpaceLogin({super.key, required this.isHideVideoDirect});
  final String? isHideVideoDirect;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 50),
        MyTextBoxForPrivateSpace(controller: controller),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: ElevatedButton(
            onPressed: () async {
              if (MyPrivateSpace.isPasswordCorrect(controller.text)) {
                if (isHideVideoDirect != null) {
                  await PrivateSpaceDb.addVideo(isHideVideoDirect!);
                  MoveVideo.hiddenVideo.add(isHideVideoDirect!);
                }
                List<String> list = await MoveVideo.getHiddenVideos();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivateSpaceShowVideoScreen(
                      isHideVideoDirect: isHideVideoDirect,
                      videoPaths: list,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: MyColors.secondaryColor,
                    content: Text(
                      'Password is wrong',
                      style: MyTextStyles.textStyle3,
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
            child: Text(
              'Submit',
              style: MyTextStyles.textStyle4,
            ),
          ),
        ),
      ],
    );
  }
}
