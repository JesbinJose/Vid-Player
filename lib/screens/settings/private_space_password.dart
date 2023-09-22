import 'package:flutter/material.dart';
import 'package:play_video/utils/private_space/private_space_shared_pref.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/utils/private_space/login.dart';
import 'package:play_video/utils/private_space/sign_in.dart';

class PrivateSpacePasswordScreen extends StatelessWidget {
  final String? isHideVideoDirect;
  const PrivateSpacePasswordScreen({super.key, this.isHideVideoDirect});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Private Space',
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: MyPrivateSpace.isLogedIn()
            ?  PrivateSpaceLogin(isHideVideoDirect: isHideVideoDirect,)
            :  PrivateSpaceSignIn(isHideVideoDirect: isHideVideoDirect),
      ),

      //body needs to be written
    );
  }
}
