// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
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
    this.banners,
    this.length,
  });

  bool? authorised;
  List<Banner>? banners;
  int? length;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorised: json["authorised"],
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "authorised": authorised,
        "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
        "length": length,
      };
}

class Banner {
  Banner({
    this.bannerImageUrl,
    this.id,
    this.bannerName,
    this.bannerImageName,
  });

  List<String>? bannerImageUrl;
  String? id;
  String? bannerName;
  String? bannerImageName;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerImageUrl: List<String>.from(json["bannerImageUrl"].map((x) => x)),
        id: json["_id"],
        bannerName: json["bannerName"],
        bannerImageName: json["bannerImageName"],
      );

  Map<String, dynamic> toJson() => {
        "bannerImageUrl": List<dynamic>.from(bannerImageUrl!.map((x) => x)),
        "_id": id,
        "bannerName": bannerName,
        "bannerImageName": bannerImageName,
      };
}
