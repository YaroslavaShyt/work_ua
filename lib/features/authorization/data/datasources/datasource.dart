import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/services/shared_pref_user.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/authorization/data/models/login_model.dart';

class AuthenticationDatasource {
  final Dio dio = Dio();

  Future<dynamic> register(UserRegisterModel model) async {
    //print(model);
    try {
      // print(jsonEncode(model.modelMap));

      print(model.usertype);
      final response = await dio.post(APIDatasource.registerUrl,
          options: buildOptions(), data: jsonEncode(model.toJson()));
      // print(response.statusCode);
      // print(response.data["data"]["token"]);
      if (response.statusCode == 201) {
        await saveAccessToken(response.data["data"]["token"]);
        await saveUserDataNamedField('id', response.data["data"]["id"]);
        await saveUserDataNamedField('usertype', response.data["usertype"]);
      }
      return UserRegisterModel.fromJson(response.data);
    } catch (e) {
      //print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Future<dynamic> logIn(LoginModel model) async {
    try {
      print(jsonEncode(model.modelMap));
      // print(model.usertype);
      final response = await dio.post(APIDatasource.loginUrl,
          options: buildOptions(), data: jsonEncode(model.modelMap));

      if (response.statusCode == 200) {
        await saveAccessToken(response.data["data"]["token"]);
        await saveUserDataNamedField('id', response.data["_id"]);
        await saveUserDataNamedField('usertype', response.data["usertype"]);
      }
      return UserRegisterModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Options buildOptions({String? authorization}) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        if (authorization != null) 'token': authorization,
      },
    );
  }
}
