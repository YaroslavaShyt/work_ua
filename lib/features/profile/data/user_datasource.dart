import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';

class UserDatasource {
  final Dio dio = Dio();

  Future<dynamic> read(String userId) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      String token = await getAccessToken();
      print(token);
      print('${APIDatasource.userUrl}$userId');
      final response = await dio.get("${APIDatasource.userUrl}$userId",
          options: buildOptions(authorization: 'Bearer $token'));

      if (response.statusCode == 200) {
        if (response.data["data"]["usertype"] == 'candidate') {
          return UserRegisterModel(
              id: response.data["data"]["id"],
              name: response.data["data"]["name"],
              contactNumber: response.data["data"]["contactNumber"],
              email: response.data["data"]["email"],
              city: response.data["data"]["city"].toString(),
              description: response.data["data"]["description"]);
        } else {
          return UserRegisterModel(
              id: response.data["data"]["id"],
              name: response.data["data"]["name"],
              title: response.data["data"]["title"],
              contactNumber: response.data["data"]["contactNumber"],
              email: response.data["data"]["email"],
              city: response.data["data"]["city"].toString(),
              description: response.data["data"]["description"]);
        }
      } else {
        return SuccessModel(
            response.data["success"],
            response.data["data"]["message"] ?? 'No message provided.',
            response.statusCode ?? 0);
      }
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }
/*
  Future<SuccessModel> update(CVModel model) async {
    try {
      //print(jsonEncode(model.modelMap));
      print(model.modelMap);
      final response = await dio.post(APIDatasource.updateCvUrl,
          options: buildOptions(), data: jsonEncode(model.modelMap));
      return SuccessModel(
          response.data["success"],
          response.data["data"]["message"] ?? 'No message provided.',
          response.statusCode ?? 0);
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Future<SuccessModel> delete(cvId) async {
    try {
      //print(jsonEncode(model.modelMap));
      // print(model.usertype);
      print("id $cvId");
      final response = await dio.delete(APIDatasource.deleteCvUrl,
          options: buildOptions(), data: jsonEncode({"id": cvId}));
      print(response.statusCode);
      return SuccessModel(
          response.data["success"],
          response.data["data"]["message"] ?? 'No message provided.',
          response.statusCode ?? 0);
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }*/

  Options buildOptions({String? authorization}) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        if (authorization != null) 'Authorization': authorization,
      },
    );
  }
}
