// To parse this JSON data, do
//
//     final userGetModel = userGetModelFromJson(jsonString);

import 'dart:convert';

UserGetModel userGetModelFromJson(String str) =>
    UserGetModel.fromJson(json.decode(str));

String userGetModelToJson(UserGetModel data) => json.encode(data.toJson());

class UserGetModel {
  String id;
  String usertype;
  String name;
  String city;
  String contactNumber;
  String email;
  List<String> socialMediaLinks;
  String? password;
  String profilePhoto;
  String surname;
  String patronymic;
  String birthDate;
  int v;
  String? title;
  String? workersQuantity;
  String? serviceType;
  String? description;

  UserGetModel({
    required this.id,
    required this.usertype,
    required this.name,
    required this.city,
    required this.contactNumber,
    required this.email,
    required this.socialMediaLinks,
    required this.password,
    required this.profilePhoto,
    required this.surname,
    required this.patronymic,
    required this.birthDate,
    required this.v,
    required this.title,
    required this.workersQuantity,
    required this.serviceType,
    required this.description,
  });

  factory UserGetModel.fromJson(Map<String, dynamic> json) => UserGetModel(
        id: json["_id"],
        usertype: json["usertype"],
        name: json["name"],
        city: json["city"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        socialMediaLinks:
            List<String>.from(json["socialMediaLinks"].map((x) => x)),
        password: json["password"],
        profilePhoto: json["profilePhoto"],
        surname: json["surname"],
        patronymic: json["patronymic"],
        birthDate: json["birthDate"],
        v: json["__v"] ?? 0,
        title: json["title"],
        workersQuantity: json["workersQuantity"],
        serviceType: json["serviceType"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "usertype": usertype,
        "name": name,
        "city": city,
        "contactNumber": contactNumber,
        "email": email,
        "socialMediaLinks": List<dynamic>.from(socialMediaLinks.map((x) => x)),
        "password": password,
        "profilePhoto": profilePhoto,
        "surname": surname,
        "patronymic": patronymic,
        "birthDate": birthDate,
        "__v": v,
        "title": title,
        "workersQuantity": workersQuantity,
        "serviceType": serviceType,
        "description": description,
      };
}
