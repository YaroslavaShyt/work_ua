// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  String user;
  String id;
  String date;
  String title;
  String salary;
  String format;
  String timeType;
  String experience;
  String description;
  int v;

  JobModel({
    required this.user,
    required this.id,
    required this.date,
    required this.title,
    required this.salary,
    required this.format,
    required this.timeType,
    required this.experience,
    required this.description,
    required this.v,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        user: json["user"] ?? 'test user ',
        id: json["_id"],
        date: json["date"],
        title: json["title"],
        salary: json["salary"],
        format: json["format"],
        timeType: json["timeType"],
        experience: json["experience"],
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date,
        "title": title,
        "salary": salary,
        "format": format,
        "timeType": timeType,
        "experience": experience,
        "description": description,
        "__v": v,
        "user": user
      };
}
