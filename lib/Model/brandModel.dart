// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
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
    this.brands,
    this.length,
  });

  bool? authorised;
  List<Brand>? brands;
  int? length;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorised: json["authorised"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "authorised": authorised,
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "length": length,
      };
}

class Brand {
  Brand({
    this.brandImageUrl,
    this.id,
    this.brandName,
    this.brandImageName,
  });

  List<String>? brandImageUrl;
  String? id;
  String? brandName;
  String? brandImageName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandImageUrl: List<String>.from(json["BrandImageUrl"].map((x) => x)),
        id: json["_id"],
        brandName: json["BrandName"],
        brandImageName: json["BrandImageName"],
      );

  Map<String, dynamic> toJson() => {
        "BrandImageUrl": List<dynamic>.from(brandImageUrl!.map((x) => x)),
        "_id": id,
        "BrandName": brandName,
        "BrandImageName": brandImageName,
      };
}
