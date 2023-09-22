import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/hive/hive.dart';
import 'package:play_video/hive/theme_color.dart';
import 'package:play_video/screens/main_screen.dart';
import 'package:play_video/screens/storage_splash.dart';
import 'package:play_video/utils/permissions/storage_permission.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class SplashWorks {
  // this is for all operation during the splash
  static Future<void> fetchFiles(final context) async {
    //initialize hive
    await Hive.initFlutter();
    await MyHive.loadAllDB();
    MyTextStyles.changeTextColor(ThemeColorDB.getColor('TextColor'));

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Mydata.version = int.parse(androidInfo.version.release);
    Mydata.permission = await MyPermissionStorage
        .permissionStorage(); //Asking the permission for storage
    if (Mydata.permission) {
      //Calling the fuction to add value to the static variables
      Mydata.myData();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(), //going to the home screen
        ),
      );
    } else {
      Mydata.permission = await MyPermissionStorage
          .permissionStorage(); //asking permission second time
      if (Mydata.permission) {
        //Calling the fuction to add value to the static variables
        Mydata.myData();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreen(), //going to the home screen
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const StorageSettings(),
          ),
        );
      }
    }
  }
}
