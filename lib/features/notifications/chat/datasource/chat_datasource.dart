import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/profile/domain/cv_model.dart';

class ChatDatasource {
  final Dio dio = Dio();

  Future<dynamic> createChat(ChatModel model) async {
    //print(model);
    try {
      //  print(jsonEncode(model.modelMap));
      // print(APIDatasource.createCvUrl);
      // print(model.usertype);
      String token = await getAccessToken();
      final response = await dio.post(APIDatasource.chatsUrl,
          options: buildOptions(authorization: 'Bearer $token'),
          data: jsonEncode(model.toJson()));
      //print('after response?');
      if (response.statusCode == 200) {
        return ChatModel.fromJson(response.data);
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

  Future<dynamic> getChat(String chatId) async {
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      final response = await dio.get(APIDatasource.chatsUrl,
          options: buildOptions(), data: jsonDecode(chatId));

      if (response.statusCode == 200) {
        // return ChatModel();
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

  Future<dynamic> getAllChats(String userId) async {
    List<ChatModel> chats = [];
    try {
      // print(jsonEncode(model.modelMap));
      // print(model.usertype);
      // print(APIDatasource.getAllCvUrl);
      // print(conditions);
      String token = await getAccessToken();
      print(token);
      final response = await dio.get('${APIDatasource.chatsUrl}$userId',
          options: buildOptions(
              authorization:
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzA5ZmMwYWY5MzYwN2FkNTM2Y2EzMyIsInBhc3N3b3JkIjoiVTJGc2RHVmtYMSswaGtKL3dXczc4RDNud3FFNXZQdk4zLzl2YlJSdmdGdmVaZDFFZWdvamdUMnVmWmRVVFlkSCIsImlhdCI6MTcwMTg3OTc0NSwiZXhwIjoxNzA2MTk5NzQ1fQ.qXIuQpdUyMD8bSNuq7vf3dhqRtOBmiKIsRJnH1RMRvM'));

      if (response.statusCode == 200) {
        print(response.statusCode);
        var listChats = response.data;
        for (var i = 0; i < listChats.length; i++) {
          chats.add(ChatModel.fromJson(listChats[i]));
        }
        print(chats);
        return chats;
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
        if (authorization != null) 'token': authorization,
      },
    );
  }
}
