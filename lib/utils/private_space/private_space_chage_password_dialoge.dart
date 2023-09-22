import 'package:flutter/material.dart';
import 'package:play_video/utils/private_space/private_space_shared_pref.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/private_space/widgets/text_box.dart';

class PrivateSpaceChangePasswordDialoge extends StatefulWidget {
  const PrivateSpaceChangePasswordDialoge({super.key});

  @override
  State<PrivateSpaceChangePasswordDialoge> createState() =>
      _PrivateSpaceChangePasswordDialogeState();
}

class _PrivateSpaceChangePasswordDialogeState
    extends State<PrivateSpaceChangePasswordDialoge> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.backgroundColor,
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.only(bottom: 30,top: 20),
              child: Text(
                'Enter new Password here',
                style: MyTextStyles.textStyle3,
              ),
            ),
            MyTextBoxForPrivateSpace(controller: controller),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () async {
            if (controller.text.isNotEmpty) {
              await MyPrivateSpace.setPassword(controller.text).then(
                (value) => Navigator.pop(
                  context,
                ),
              );
            }
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
