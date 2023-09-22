import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageSettings extends StatelessWidget {
  const StorageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Give Storage permission'),
          Container(
            decoration:  BoxDecoration(
              color: MyColors.primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: TextButton(
              onPressed: () async {
                await openAppSettings(); // going to settings
              },
              child: const Text('Go to settings'),
            ),
          ),
        ],
      ),
    );
  }
}
