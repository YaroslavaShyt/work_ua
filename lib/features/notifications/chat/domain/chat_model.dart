import 'dart:convert';

import 'package:work_ua/features/notifications/chat/domain/latest_message_model.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  String id;
  String chatName;
  bool isGroupChat;
  List<dynamic> user;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  LatestMessage latestMessage;

  Chat({
    required this.id,
    required this.chatName,
    required this.isGroupChat,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.latestMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        chatName: json["chatName"],
        isGroupChat: json["isGroupChat"],
        user: List<dynamic>.from(json["user"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: LatestMessage.fromJson(json["latestMessage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatName": chatName,
        "isGroupChat": isGroupChat,
        "user": List<dynamic>.from(user.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "latestMessage": latestMessage.toJson(),
      };
}

