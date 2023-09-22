import 'package:shared_preferences/shared_preferences.dart';

class MyPrivateSpace {
  static late SharedPreferences preferences;
  static Future<void> loadSharedPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  static bool isLogedIn() {
    return preferences.getString('key') != null;
  }

  static bool isPasswordCorrect(String password) {
    final String? pass = preferences.getString('key');
    return pass == password;
  }

  static Future<void> setPassword(String pass) async {
    preferences.setString('key', pass);
  }

  static Future<void> deletePassword() async {
    await preferences.remove('key');
  }
}
