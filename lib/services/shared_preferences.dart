import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  getSharedPreferencesInstance() async {
    // _prefs = await SharedPreferences.getInstance().catchError((e) {
    //   print("shared preferences error : $e");
    //   return null;
    // });
  }
//USER TOKEN
  Future setToken(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('token', token);
  }

  Future clearToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }

  Future<String> token() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('token');
  }

  //USER LANGUAGE
  Future setLanguage(String language) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('language', language);
  }

  Future<String> language() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('language');
  }

//App Theme
  Future setTheme(bool theme) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('theme', theme);
  }

  Future<bool> theme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('theme');
  }
}
