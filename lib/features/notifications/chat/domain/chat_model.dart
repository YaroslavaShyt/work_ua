import 'dart:convert';

import 'package:work_ua/features/notifications/chat/domain/latest_message_model.dart';

ChatModel chatFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String position;
  String id;
  String companyName;
  bool isGroupChat;
  List<dynamic> user;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
 // LatestMessage latestMessage;

  ChatModel({
    required this.position,
    required this.id,
    required this.companyName,
    required this.isGroupChat,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  //  required this.latestMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      id: json["_id"] ?? '1',
      position: json["position"] ?? 'test',
      companyName: json["companyName"] ?? 'company',
      isGroupChat: json["isGroupChat"] ?? true,
      user: List<dynamic>.from(json["user"].map((x) => x)) ?? [],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    //  latestMessage: LatestMessage.fromJson(json["latestMessage"])
    );

  Map<String, dynamic> toJson() => {
        //"_id": id,
        "position": position,
        "companyName": companyName,
       // "isGroupChat": isGroupChat,
        "user": List<dynamic>.from(user.map((x) => x)),
      //  "createdAt": createdAt.toIso8601String(),
      //  "updatedAt": updatedAt.toIso8601String(),
     //   "__v": v,
     //   "latestMessage": latestMessage.toJson(),
      };
}
