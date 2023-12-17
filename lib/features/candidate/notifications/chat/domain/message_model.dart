import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  String id;
  dynamic sender;
  String content;
  String receiver;
  dynamic chat;
  List<dynamic> readBy;
  int v;

  MessageModel({
    required this.id,
    required this.sender,
    required this.content,
    required this.receiver,
    required this.chat,
    required this.readBy,
    required this.v,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    //print(json);
    return MessageModel(
      id: json["_id"],
      sender: json["sender"],
      content: json["content"],
      receiver: json["receiver"],
      chat: json["chat"],
      readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender,
        "content": content,
        "receiver": receiver,
        "chat": chat,
        "readBy": List<dynamic>.from(readBy.map((x) => x)),
        "__v": v,
      };
}
