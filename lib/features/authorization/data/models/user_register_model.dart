import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) =>
    UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) =>
    json.encode(data.toJson());

class UserRegisterModel {
  String usertype;
  String name;
  String surname;
  String patronymic;
  String birthDate;
  String city;
  String contactNumber;
  String email;
  String socialMediaLinks;
  String password;
  String profilePhoto;
  String title;
  String workersQuantity;
  String serviceType;
  String description;

  UserRegisterModel({
    required this.usertype,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.birthDate,
    required this.city,
    required this.contactNumber,
    required this.email,
    required this.socialMediaLinks,
    required this.password,
    required this.profilePhoto,
    required this.title,
    required this.workersQuantity,
    required this.serviceType,
    required this.description,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        usertype: json["usertype"],
        name: json["name"],
        surname: json["surname"] ?? 'surn',
        patronymic: json["patronymic"] ?? 'surn',
        birthDate: json["birthDate"] ?? 'surn',
        city: json["city"] ?? 'surn',
        contactNumber: json["contactNumber"] ?? 'surn',
        email: json["email"] ?? 'surn',
        socialMediaLinks: json["socialMediaLinks"].toString() ?? 'surn',
        password: json["password"] ?? 'surn',
        profilePhoto: json["profilePhoto"] ?? 'surn',
        title: json["title"] ?? 'surn',
        workersQuantity: json["workersQuantity"] ?? 'surn',
        serviceType: json["serviceType"] ?? 'surn',
        description: json["description"] ?? 'surn',
      );

  Map<String, dynamic> toJson() => {
        "usertype": usertype,
        "name": name,
        "surname": surname,
        "patronymic": patronymic,
        "birthDate": birthDate,
        "city": city,
        "contactNumber": contactNumber,
        "email": email,
        "socialMediaLinks": socialMediaLinks,
        "password": password,
        "profilePhoto": profilePhoto,
        "title": title,
        "workersQuantity": workersQuantity,
        "serviceType": serviceType,
        "description": description,
      };
}
