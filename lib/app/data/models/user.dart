// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? success;
  String? noMember;
  String? loyalty;
  String? idType;
  String? idNumber;
  String? username;
  String? name;
  String? image;
  String? contact;
  String? address;
  String? district;
  String? city;
  String? province;
  String? postalCode;

  User({
    this.success,
    this.noMember,
    this.loyalty,
    this.idType,
    this.idNumber,
    this.username,
    this.name,
    this.image,
    this.contact,
    this.address,
    this.district,
    this.city,
    this.province,
    this.postalCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        noMember: json["no_member"],
        loyalty: json["loyalty"],
        idType: json["id_type"],
        idNumber: json["id_number"],
        username: json["username"],
        name: json["name"],
        image: json["image"],
        contact: json["contact"],
        address: json["address"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "no_member": noMember,
        "loyalty": loyalty,
        "id_type": idType,
        "id_number": idNumber,
        "username": username,
        "name": name,
        "image": image,
        "contact": contact,
        "address": address,
        "district": district,
        "city": city,
        "province": province,
        "postal_code": postalCode,
      };
}
