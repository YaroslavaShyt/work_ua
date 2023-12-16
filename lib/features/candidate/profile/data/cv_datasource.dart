import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';

class CVDatasource {
  final Dio dio = Dio();

  Future<SuccessModel> create(model) async {
    print(model);
    try {
      print(jsonEncode(model.modelMap));
      print(APIDatasource.createCvUrl);
      // print(model.usertype);
      final response = await dio.post(APIDatasource.createCvUrl,
          options: buildOptions(), data: jsonEncode(model.modelMap));
      print('after response?');
      return SuccessModel(
          response.data["success"],
          response.data["data"]["message"] ?? 'No message provided.',
          response.statusCode ?? 0);
    } catch (e) {
      print(e.toString());
      return SuccessModel(false, e.toString(), 0);
    }
  }

  Future<dynamic> read(cvId) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      final response = await dio.post(APIDatasource.getCvUrl,
          options: buildOptions(), data: jsonEncode({"id": cvId}));

      if (response.statusCode == 200) {
        return CVModel(
            userId: response.data["data"]["userId"],
            id: response.data["data"]["id"],
            position: response.data["data"]["position"],
            city: response.data["data"]["city"].toString(),
            description: response.data["data"]["description"]);
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

  Future<dynamic> readAll(Map<String, dynamic> conditions) async {
    List<CVModel> cvs = [];
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      // print(APIDatasource.getAllCvUrl);
      // print(conditions);
      final response = await dio.get(APIDatasource.getAllCvUrl,
          options: buildOptions(), data: jsonEncode(conditions));

      if (response.statusCode == 200) {
        var listOfCVs = response.data["data"];
        for (var i = 0; i < listOfCVs.length; i++) {
          cvs.add(CVModel.fromJson(listOfCVs[i]));
        }
        return cvs;
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
