import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:work_ua/core/api_datasource.dart';
import 'package:work_ua/core/services/shared_pref_token.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/message_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/send_message_model.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';

class MessageDatasource {
  final Dio dio = Dio();

  Future<dynamic> sendMessage(SendMessageModel model) async {
    //print(model);
    try {
      //  print(jsonEncode(model.modelMap));
      // print(APIDatasource.createCvUrl);
      // print(model.usertype);
      print("Model in sendMessage input \n${model.toJson()}\n");
      String token = await getAccessToken();
      final response = await dio.post(APIDatasource.messagesUrl,
          options: buildOptions(authorization: 'Bearer $token'),
          data: jsonEncode(model.toJson()));
      //print('after response?');
      if (response.statusCode == 200) {
        return MessageModel.fromJson(response.data);
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

  Future<dynamic> getMessages(String chatId, int offset) async {
    //print(model);
    try {
      List<MessageModel> messages = [];
      //  print(jsonEncode(model.modelMap));
      // print(APIDatasource.createCvUrl);
      // print(model.usertype);
      String token = await getAccessToken();
      final response = await dio.get(APIDatasource.messagesUrl,
          options: buildOptions(authorization: 'Bearer $token'),
          data: jsonEncode({"chatId": chatId, "page": offset.toString()}));
      //print('after response?');

      var rawData = response.data;
      for (var i = 0; i < rawData.length; i++) {
        messages.add(MessageModel.fromJson(response.data[i]));
      }
      //print(messages);
      return messages;
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
