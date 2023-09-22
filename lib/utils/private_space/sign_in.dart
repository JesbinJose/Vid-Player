// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:play_video/utils/private_space/private_space_shared_pref.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';
import 'package:play_video/widgets/private_space/widgets/text_box.dart';

class PrivateSpaceSignIn extends StatelessWidget {
  const PrivateSpaceSignIn({super.key, required this.isHideVideoDirect});
  final String? isHideVideoDirect;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controllersecond = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MyTextBoxForPrivateSpace(
          controller: controller,
        ),
        const SizedBox(
          height: 30,
        ),
        MyTextBoxForPrivateSpace(
          text: 'Confirm password',
          controller: controllersecond,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: ElevatedButton(
            onPressed: () async {
              final PermissionStatus manageStorage =
                  await Permission.manageExternalStorage.request();
              if (controller.text == controllersecond.text &&
                  manageStorage.isGranted) {
                await MyPrivateSpace.setPassword(controller.text).then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivateSpaceShowVideoScreen(
                        isHideVideoDirect: isHideVideoDirect,
                        videoPaths: const [],
                      ),
                    ),
                  );
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Give storage permission for private space',
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
