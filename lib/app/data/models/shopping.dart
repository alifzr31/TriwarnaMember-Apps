// To parse this JSON data, do
//
//     final shopping = shoppingFromJson(jsonString);

import 'dart:convert';

Shopping shoppingFromJson(String str) => Shopping.fromJson(json.decode(str));

String shoppingToJson(Shopping data) => json.encode(data.toJson());

List<Shopping> listShoppingFromJson(String str) =>
    List<Shopping>.from(json.decode(str).map((x) => Shopping.fromJson(x)));

String listShoppingToJson(List<Shopping> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shopping {
    String? docnum;
    String? noStruk;
    DateTime? date;
    String? total;
    String? noMember;

    Shopping({
        this.docnum,
        this.noStruk,
        this.date,
        this.total,
        this.noMember,
    });

    factory Shopping.fromJson(Map<String, dynamic> json) => Shopping(
        docnum: json["docnum"],
        noStruk: json["no_struk"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        total: json["total"],
        noMember: json["no_member"],
    );

    Map<String, dynamic> toJson() => {
        "docnum": docnum,
        "no_struk": noStruk,
        "date": date?.toIso8601String(),
        "total": total,
        "no_member": noMember,
    };
}
