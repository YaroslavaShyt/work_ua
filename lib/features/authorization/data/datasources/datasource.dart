import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/candidate_register_model.dart';

abstract class AuthenticationDatasource {
  Future<SuccessModel> register(CandidateRegisterModel model);
  Future<SuccessModel> logIn();
}

class AuthenticationDatasourceImp implements AuthenticationDatasource {
  final Dio dio = Dio();

  @override
  Future<SuccessModel> register(CandidateRegisterModel model) async {
    //  try{
    final response =
        await dio.post(APIDatasource.registerUrl, options: buildOptions());
    return SuccessModel.fromJson(response.data);
    //  }catch (e){

    //}
  }

  @override
  Future<SuccessModel> logIn() {
    // TODO: implement logIn
    throw UnimplementedError();
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
