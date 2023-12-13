import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/search/data/job_model.dart';

class SearchDatasource {
  final Dio dio = Dio();

  Future<dynamic> searchVacancy(String searchString) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      List<JobModel> jobs = [];
      String token = await getAccessToken();
      //print(token);
      //print('${APIDatasource.userUrl}$userId');
      final response = await dio.get("${APIDatasource.getJobs}$searchString",
          options: buildOptions(authorization: 'Bearer $token'));

      if (response.statusCode == 200) {
        var rawDara = response.data;
        for (var i = 0; i < rawDara.length; i++) {
          jobs.add(JobModel.fromJson(rawDara[i]));
        }
        return jobs;
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

  Future<dynamic> getVacancy(String id) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      String token = await getAccessToken();
      //print(token);
      //print('${APIDatasource.userUrl}$userId');
      final response = await dio.get("${APIDatasource.getJob}$id",
          options: buildOptions(authorization: 'Bearer $token'));

      if (response.statusCode == 200) {
        return JobModel.fromJson(response.data);
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

  Future<dynamic> createVacancy(JobModel model) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      String token = await getAccessToken();
      //print(token);
      //print('${APIDatasource.userUrl}$userId');
      final response = await dio.post("${APIDatasource.createJob}",
          options: buildOptions(authorization: 'Bearer $token'));

      if (response.statusCode == 200) {
        return JobModel.fromJson(response.data);
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

  Options buildOptions({String? authorization}) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        if (authorization != null) 'token': authorization,
      },
    );
  }
}
