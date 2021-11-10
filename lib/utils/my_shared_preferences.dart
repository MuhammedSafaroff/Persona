import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  SharedPreferences? prefs;
  Future<void> addSharedToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('token', value);
  }

  Future<void> removeSharedToken() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove('token');
  }

  Future<String> getSharedToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString('token') ?? '';
  }
}
