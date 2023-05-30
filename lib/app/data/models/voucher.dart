// To parse this JSON data, do
//
//     final voucher = voucherFromJson(jsonString);

import 'dart:convert';

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));

String voucherToJson(Voucher data) => json.encode(data.toJson());

List<Voucher> listVoucherFromJson(String str) =>
    List<Voucher>.from(json.decode(str).map((x) => Voucher.fromJson(x)));
    
String listVoucherToJson(List<Voucher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Voucher {
    String? serialnumber;
    String? prizeName;
    String? prizeDesc;
    String? qrcode;
    String? status;

    Voucher({
        this.serialnumber,
        this.prizeName,
        this.prizeDesc,
        this.qrcode,
        this.status,
    });

    factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        serialnumber: json["serialnumber"],
        prizeName: json["prize_name"],
        prizeDesc: json["prize_desc"],
        qrcode: json["qrcode"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "serialnumber": serialnumber,
        "prize_name": prizeName,
        "prize_desc": prizeDesc,
        "qrcode": qrcode,
        "status": status,
    };
}
