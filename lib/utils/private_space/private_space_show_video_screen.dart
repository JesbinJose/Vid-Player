import 'package:flutter/material.dart';
import 'package:play_video/utils/private_space/move_video_to_temp.dart';
import 'package:play_video/utils/private_space/private_space_chage_password_dialoge.dart';
import 'package:play_video/utils/private_space/private_space_show_video_widget.dart';
import 'package:play_video/utils/private_space/private_space_video_select_dialog.dart';
import 'package:play_video/utils/styles/styles.dart';

class PrivateSpaceShowVideoScreen extends StatefulWidget {
  const PrivateSpaceShowVideoScreen({
    super.key,
    required this.isHideVideoDirect,
    required this.videoPaths,
  });
  final String? isHideVideoDirect;
  final List<String> videoPaths;
  @override
  State<PrivateSpaceShowVideoScreen> createState() =>
      PrivateSpaceShowVideoScreenState();
}

class PrivateSpaceShowVideoScreenState
    extends State<PrivateSpaceShowVideoScreen> {
  Future<void> refresh() async{
    videoPaths = await MoveVideo.getHiddenVideos();
    setState(() {});
  }

  @override
  void initState() {
    videoPaths = widget.videoPaths;
    super.initState();
  }

  late List<String> videoPaths;
  @override
  void dispose() {
    MoveVideo.hideAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Private Space',
          style: MyTextStyles.textStyle2,
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => const PrivateSpaceChangePasswordDialoge(),
            ),
            icon: const Icon(
              Icons.sync_lock_outlined,
            ),
            color: MyColors.iconsColor,
          ),
        ],
      ),
      body: PrivateSpaceShowThumbnail(
        instance: this,
        hiddenPaths: videoPaths,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => PrivateSpaceSelectVideoDialog(
              instace: this,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
