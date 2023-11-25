class CVModel {
  final String? id;
  final String userId;
  final String position;
  final String city;
  final String description;

  CVModel(
      {this.id,
      this.userId = "655c7d917de5799cf02aef77",
      required this.position,
      required this.city,
      required this.description});

  Map<String, dynamic> get modelMap => {
        "id": id,
        "userId": userId,
        "position": position,
        "city": city,
        "description": description
      };

  factory CVModel.fromJson(Map<String, dynamic> data) {
    return CVModel(
        id: data["_id"],
        userId: data["userId"],
        position: data["position"],
        city: data["city"].toString(),
        description: data["description"]);
  }
}
