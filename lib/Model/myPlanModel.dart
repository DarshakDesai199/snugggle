// To parse this JSON data, do
//
//     final myPlanResModel = myPlanResModelFromJson(jsonString);

import 'dart:convert';

MyPlanResModel myPlanResModelFromJson(String str) =>
    MyPlanResModel.fromJson(json.decode(str));

String myPlanResModelToJson(MyPlanResModel data) => json.encode(data.toJson());

class MyPlanResModel {
  MyPlanResModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory MyPlanResModel.fromJson(Map<String, dynamic> json) => MyPlanResModel(
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
    this.plansDetails,
    this.isPaused,
    this.id,
    this.planId,
    this.userId,
    this.planDescription,
    this.planPrice,
    this.planOffer,
    this.points,
    this.startsAt,
    this.endsAt,
    this.weekendPoints,
    this.spendsWeekendPoints,
    this.totalSpendPoints,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<String>? plansDetails;
  bool? isPaused;
  String? id;
  String? planId;
  String? userId;
  String? planDescription;
  int? planPrice;
  String? planOffer;
  int? points;
  DateTime? startsAt;
  DateTime? endsAt;
  int? weekendPoints;
  int? spendsWeekendPoints;
  int? totalSpendPoints;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        plansDetails: List<String>.from(json["plansDetails"].map((x) => x)),
        isPaused: json["isPaused"],
        id: json["_id"],
        planId: json["planId"],
        userId: json["userId"],
        planDescription: json["planDescription"],
        planPrice: json["planPrice"],
        planOffer: json["planOffer"],
        points: json["points"],
        startsAt: DateTime.parse(json["startsAt"]),
        endsAt: DateTime.parse(json["endsAt"]),
        weekendPoints: json["weekendPoints"],
        spendsWeekendPoints: json["spendsWeekendPoints"],
        totalSpendPoints: json["totalSpendPoints"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "plansDetails": List<dynamic>.from(plansDetails!.map((x) => x)),
        "isPaused": isPaused,
        "_id": id,
        "planId": planId,
        "userId": userId,
        "planDescription": planDescription,
        "planPrice": planPrice,
        "planOffer": planOffer,
        "points": points,
        "startsAt": startsAt!.toIso8601String(),
        "endsAt": endsAt!.toIso8601String(),
        "weekendPoints": weekendPoints,
        "spendsWeekendPoints": spendsWeekendPoints,
        "totalSpendPoints": totalSpendPoints,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
