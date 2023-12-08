class LatestMessage {
  String id;
  dynamic sender;
  String content;
  String receiver;
  String chat;
  List<dynamic> readBy;
  int v;

  LatestMessage({
    required this.id,
    required this.sender,
    required this.content,
    required this.receiver,
    required this.chat,
    required this.readBy,
    required this.v,
  });

  factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
        id: json["_id"],
        sender: json["sender"],
        content: json["content"],
        receiver: json["receiver"],
        chat: json["chat"],
        readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
        v: json["__v"],
      );

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
