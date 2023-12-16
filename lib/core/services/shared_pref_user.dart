import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';

Future<void> saveUserData(UserRegisterModel model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  model.toJson().forEach((key, value) async {
    if (value != null) {
      await prefs.setString(key, value);
    }
  });
}

Future<void> saveUserDataNamedField(name, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(name, value);
}

Future<bool> hasUserData(UserRegisterModel model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, bool> data = {};
  model.toJson().forEach((key, value) {
    if (value != null) {
      data[key] = prefs.containsKey('accessToken');
    }
  });
  return prefs.containsKey('accessToken');
}

Future<Map> getUserData(UserRegisterModel model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, String> data = {};
  model.toJson().forEach((key, value) {
      data[key] = prefs.getString(key) ?? '';
  });
  return data;
}

Future<String> getUserFieldNamed(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value =  prefs.getString(name) ?? '';
  return value;
}

Future<bool> removeValueFromSharedPreferences(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = await prefs.remove(key);
  return result;
}
