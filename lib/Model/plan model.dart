// To parse this JSON data, do
//
//     final planData = planDataFromJson(jsonString);

import 'dart:convert';

PlanData planDataFromJson(String str) => PlanData.fromJson(json.decode(str));

String planDataToJson(PlanData data) => json.encode(data.toJson());

class PlanData {
  PlanData({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory PlanData.fromJson(Map<String, dynamic> json) => PlanData(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.plansDetails,
    this.id,
    this.planName,
    this.planDescription,
    this.planPrice,
    this.planOffer,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<String>? plansDetails;
  String? id;
  String? planName;
  String? planDescription;
  int? planPrice;
  int? planOffer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        plansDetails: List<String>.from(json["plansDetails"].map((x) => x)),
        id: json["_id"],
        planName: json["planName"],
        planDescription: json["planDescription"],
        planPrice: json["planPrice"],
        planOffer: json["planOffer"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "plansDetails": List<dynamic>.from(plansDetails!.map((x) => x)),
        "_id": id,
        "planName": planName,
        "planDescription": planDescription,
        "planPrice": planPrice,
        "planOffer": planOffer,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
