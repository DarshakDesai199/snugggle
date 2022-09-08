// To parse this JSON data, do
//
//     final allCategoriesModel = allCategoriesModelFromJson(jsonString);

import 'dart:convert';

AllCategoriesModel allCategoriesModelFromJson(String str) =>
    AllCategoriesModel.fromJson(json.decode(str));

String allCategoriesModelToJson(AllCategoriesModel data) =>
    json.encode(data.toJson());

class AllCategoriesModel {
  AllCategoriesModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      AllCategoriesModel(
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
