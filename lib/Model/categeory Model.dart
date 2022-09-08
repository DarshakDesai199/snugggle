// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    this.category,
    this.length,
  });

  bool? authorised;
  List<Category>? category;
  int? length;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorised: json["authorised"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "authorised": authorised,
        "category": List<dynamic>.from(category!.map((x) => x.toJson())),
        "length": length,
      };
}

class Category {
  Category({
    this.id,
    this.catType,
    this.catTypeDescription,
    this.attrId,
    this.catIsClosed,
    this.catIsHold,
    this.catCreatedAt,
  });

  String? id;
  String? catType;
  String? catTypeDescription;
  String? attrId;
  bool? catIsClosed;
  bool? catIsHold;
  DateTime? catCreatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        catType: json["catType"],
        catTypeDescription: json["catTypeDescription"],
        attrId: json["attrId"],
        catIsClosed: json["catIsClosed"],
        catIsHold: json["catIsHold"],
        catCreatedAt: DateTime.parse(json["catCreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "catType": catType,
        "catTypeDescription": catTypeDescription,
        "attrId": attrId,
        "catIsClosed": catIsClosed,
        "catIsHold": catIsHold,
        "catCreatedAt": catCreatedAt!.toIso8601String(),
      };
}
