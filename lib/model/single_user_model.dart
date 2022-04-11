// To parse this JSON data, do
//
//     final singleusermodel = singleusermodelFromJson(jsonString);

import 'dart:convert';

class Singleusermodel {
  Singleusermodel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory Singleusermodel.fromRawJson(String str) =>
      Singleusermodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Singleusermodel.fromJson(Map<String, dynamic> json) =>
      Singleusermodel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar == null ? null : avatar,
      };
}
