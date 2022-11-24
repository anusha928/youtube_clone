import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const firsttime = "firsttime";
  static const String userToken = "UserToken";

  static Future<bool> isFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(firsttime) ?? true;
  }

  static Future<void> setFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(firsttime, false);
  }

  static Future<String?> getUsertoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userToken);
  }

  static Future<void> setUsertoken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(userToken, token);
  }
  static Future<void> removeUsertoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(userToken);
  }
  
  }

