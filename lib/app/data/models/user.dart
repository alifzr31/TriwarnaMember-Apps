// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? success;
  String? noMember;
  String? codeName;
  String? loyalty;
  String? username;
  String? idType;
  String? idNumber;
  String? name;
  String? group;
  String? pin;
  String? gender;
  String? image;
  String? contact;
  String? religion;
  String? maritalStatus;
  String? job;
  String? address;
  String? district;
  String? city;
  String? province;
  String? postalCode;
  String? fullAddress;
  String? education;
  String? loyaltyPoint;
  DateTime? joinedDate;
  String? spendingTotal;
  String? statusActive;
  String? verifyStatus;
  DateTime? lastActivity;

  User({
    this.success,
    this.noMember,
    this.codeName,
    this.loyalty,
    this.username,
    this.idType,
    this.idNumber,
    this.name,
    this.group,
    this.pin,
    this.gender,
    this.image,
    this.contact,
    this.religion,
    this.maritalStatus,
    this.job,
    this.address,
    this.district,
    this.city,
    this.province,
    this.postalCode,
    this.fullAddress,
    this.education,
    this.loyaltyPoint,
    this.joinedDate,
    this.spendingTotal,
    this.statusActive,
    this.verifyStatus,
    this.lastActivity,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        noMember: json["no_member"],
        codeName: json["code_name"],
        loyalty: json["loyalty"],
        username: json["username"],
        idType: json["id_type"],
        idNumber: json["id_number"],
        name: json["name"],
        group: json["group"],
        pin: json["pin"],
        gender: json["gender"],
        image: json["image"],
        contact: json["contact"],
        religion: json["religion"],
        maritalStatus: json["marital_status"],
        job: json["job"],
        address: json["address"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postal_code"],
        fullAddress: json["full_address"],
        education: json["education"],
        loyaltyPoint: json["loyalty_point"],
        joinedDate: json["joined_date"] == null
            ? null
            : DateTime.parse(json["joined_date"]),
        spendingTotal: json["spending_total"],
        statusActive: json["status_active"],
        verifyStatus: json["verify_status"],
        lastActivity: json["last_activity"] == null
            ? null
            : DateTime.parse(json["last_activity"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "no_member": noMember,
        "code_name": codeName,
        "loyalty": loyalty,
        "username": username,
        "id_type": idType,
        "id_number": idNumber,
        "name": name,
        "group": group,
        "pin": pin,
        "gender": gender,
        "image": image,
        "contact": contact,
        "religion": religion,
        "marital_status": maritalStatus,
        "job": job,
        "address": address,
        "district": district,
        "city": city,
        "province": province,
        "postal_code": postalCode,
        "full_address": fullAddress,
        "education": education,
        "loyalty_point": loyaltyPoint,
        "joined_date": joinedDate?.toIso8601String(),
        "spending_total": spendingTotal,
        "status_active": statusActive,
        "verify_status": verifyStatus,
        "last_activity": lastActivity?.toIso8601String(),
      };
}
