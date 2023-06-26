// To parse this JSON data, do
//
//     final lottery = lotteryFromJson(jsonString);

// To parse this JSON data, do
//
//     final lottery = lotteryFromJson(jsonString);

import 'dart:convert';

Lottery lotteryFromJson(String str) => Lottery.fromJson(json.decode(str));

String lotteryToJson(Lottery data) => json.encode(data.toJson());

List<Lottery> listLotteryFromJson(String str) =>
    List<Lottery>.from(json.decode(str).map((x) => Lottery.fromJson(x)));
    
String listLotteryToJson(List<Lottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lottery {
    String? no;
    String? noUndian;
    DateTime? tanggal;
    String? rowNum;

    Lottery({
        this.no,
        this.noUndian,
        this.tanggal,
        this.rowNum,
    });

    factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        no: json["no"],
        noUndian: json["no_undian"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        rowNum: json["row_num"],
    );

    Map<String, dynamic> toJson() => {
        "no": no,
        "no_undian": noUndian,
        "tanggal": tanggal?.toIso8601String(),
        "row_num": rowNum,
    };
}
