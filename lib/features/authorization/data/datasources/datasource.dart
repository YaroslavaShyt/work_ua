import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/candidate_register_model.dart';
import 'package:work_ua/features/authorization/data/models/company_register_model.dart';
import 'package:work_ua/features/authorization/data/models/login_model.dart';

class AuthenticationDatasource {
  final Dio dio = Dio();

  Future<SuccessModel> register(model) async {
    //print(model);
    try {
      // print(jsonEncode(model.modelMap));
      if (model is CandidateRegisterModel || model is CompanyRegisterModel) {
        // print(model.usertype);
        final response = await dio.post(APIDatasource.registerUrl,
            options: buildOptions(), data: jsonEncode(model.modelMap));
        // print(response.statusCode);
        // print(response.data["data"]["token"]);
        if (response.statusCode == 201) {
          await saveAccessToken(response.data["data"]["token"]);
        }
        return SuccessModel(
            response.data["success"],
            response.data["message"] ?? 'No message provided.',
            response.statusCode ?? 0);
      } else {
        return SuccessModel(false, 'Incorrect model type', 0);
      }
    } catch (e) {
      //print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Future<SuccessModel> logIn(LoginModel model) async {
    try {
      print(jsonEncode(model.modelMap));
      // print(model.usertype);
      final response = await dio.post(APIDatasource.loginUrl,
          options: buildOptions(), data: jsonEncode(model.modelMap));
    
      if (response.statusCode == 200) {
        await saveAccessToken(response.data["data"]["token"]);
      }
      return SuccessModel(
          response.data["success"],
          response.data["data"]["message"] ?? 'No message provided.',
          response.statusCode ?? 0);
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Options buildOptions({String? authorization}) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        if (authorization != null) 'Authorization': authorization,
      },
    );
  }
}
