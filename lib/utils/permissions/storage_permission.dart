import 'package:permission_handler/permission_handler.dart';
import 'package:play_video/data/data.dart';

//asking permissison for storage and return a bool is it is given or not
class MyPermissionStorage {
  static Future<bool> permissionStorage() async {
    PermissionStatus permissionStatus;
    if (Mydata.version < 13) {
      //if it is android version below 13 then asking for storage permission
      permissionStatus = await Permission.storage.request();
    } else {
      //if it is android 13 or above asking video permission
      permissionStatus = await Permission.videos.request();
    }
    return permissionStatus.isGranted;
  }
}
