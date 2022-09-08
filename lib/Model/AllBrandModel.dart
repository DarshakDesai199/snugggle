// To parse this JSON data, do
//
//     final allBrandModel = allBrandModelFromJson(jsonString);

import 'dart:convert';

AllBrandModel allBrandModelFromJson(String str) =>
    AllBrandModel.fromJson(json.decode(str));

String allBrandModelToJson(AllBrandModel data) => json.encode(data.toJson());

class AllBrandModel {
  AllBrandModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory AllBrandModel.fromJson(Map<String, dynamic> json) => AllBrandModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.authorised,
    this.uniqueArray,
    this.length,
  });

  bool? authorised;
  List<String>? uniqueArray;
  int? length;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorised: json["authorised"],
        uniqueArray: List<String>.from(json["uniqueArray"].map((x) => x)),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "authorised": authorised,
        "uniqueArray": List<dynamic>.from(uniqueArray!.map((x) => x)),
        "length": length,
      };
}
