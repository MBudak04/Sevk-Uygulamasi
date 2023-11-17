import 'package:shared_preferences/shared_preferences.dart';

class RememberMe {
  Future<bool> getRememberMeStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool rememberMe = prefs.getBool('rememberMe') ?? false;
  return rememberMe;
}

  void saveRememberMeStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }
}
