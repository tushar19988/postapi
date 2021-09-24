// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.result,
    required this.message,
    required this.data,
  });

  bool result;
  String message;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    result: json["result"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.phoneVerified,
    this.email,
    this.emailVerifiedAt,
    required this.password,
    required this.wallet,
    this.rememberToken,
    this.photo,
    this.drivingLicence,
    this.characternote,
    required this.createdAt,
    required this.updatedAt,
    this.address,
    this.blockuser,
  });

  int id;
  String name;
  String phone;
  String phoneVerified;
  dynamic email;
  dynamic emailVerifiedAt;
  String password;
  int wallet;
  dynamic rememberToken;
  dynamic photo;
  dynamic drivingLicence;
  dynamic characternote;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic address;
  dynamic blockuser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    phoneVerified: json["phone_verified"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    wallet: json["wallet"],
    rememberToken: json["remember_token"],
    photo: json["photo"],
    drivingLicence: json["driving_licence"],
    characternote: json["characternote"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    address: json["address"],
    blockuser: json["blockuser"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "phone_verified": phoneVerified,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "wallet": wallet,
    "remember_token": rememberToken,
    "photo": photo,
    "driving_licence": drivingLicence,
    "characternote": characternote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "address": address,
    "blockuser": blockuser,
  };
}
