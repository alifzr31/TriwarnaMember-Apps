// To parse this JSON data, do
//
//     final village = villageFromJson(jsonString);

import 'dart:convert';

Village villageFromJson(String str) => Village.fromJson(json.decode(str));

String villageToJson(Village data) => json.encode(data.toJson());

List<Village> listVillageFromJson(String str) =>
    List<Village>.from(json.decode(str).map((x) => Village.fromJson(x)));
    
String listVillageToJson(List<Village> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Village {
    String? kdKelurahan;
    String? namaKelurahan;
    String? namaKecamatan;

    Village({
        this.kdKelurahan,
        this.namaKelurahan,
        this.namaKecamatan,
    });

    factory Village.fromJson(Map<String, dynamic> json) => Village(
        kdKelurahan: json["KdKelurahan"],
        namaKelurahan: json["NamaKelurahan"],
        namaKecamatan: json["NamaKecamatan"],
    );

    Map<String, dynamic> toJson() => {
        "KdKelurahan": kdKelurahan,
        "NamaKelurahan": namaKelurahan,
        "NamaKecamatan": namaKecamatan,
    };
}
