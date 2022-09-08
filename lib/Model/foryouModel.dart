// To parse this JSON data, do
//
//     final forYouModel = forYouModelFromJson(jsonString);

import 'dart:convert';

ForYouModel forYouModelFromJson(String str) =>
    ForYouModel.fromJson(json.decode(str));

String forYouModelToJson(ForYouModel data) => json.encode(data.toJson());

class ForYouModel {
  ForYouModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ForYouModel.fromJson(Map<String, dynamic> json) => ForYouModel(
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
    this.data,
    this.length,
  });

  bool? authorised;
  List<Datum>? data;
  int? length;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorised: json["authorised"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "authorised": authorised,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "length": length,
      };
}

class Datum {
  Datum({
    this.inFavorite,
    this.inWardrobe,
    this.id,
    this.productImageUrl,
    this.isDeleted,
    this.productName,
    this.productDescription,
    this.productBrand,
    this.productColor,
    this.productType,
    this.productPattern,
    this.productSleeveLength,
    this.productOccasion,
    this.productNeck,
    this.productFabric,
    this.productWashCare,
    this.productSustainable,
    this.status,
    this.approvedBy,
    this.ownerId,
    this.finalApprovedBy,
    this.category,
    this.productGender,
    this.productMrp,
    this.productPrice,
    this.productCoin,
    this.productCoinCreatedAt,
    this.productCoinUpdatedAt,
    this.productDiscountInPercentage,
    this.productDiscountInAmount,
    this.productDepreciationRate,
    this.productDepreciationTenture,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ownerInfo,
    this.selectorInfo,
    this.fashionHeadInfo,
  });

  bool? inFavorite;
  bool? inWardrobe;
  String? id;
  List<String>? productImageUrl;
  bool? isDeleted;
  String? productName;
  String? productDescription;
  String? productBrand;
  String? productColor;
  String? productType;
  String? productPattern;
  String? productSleeveLength;
  String? productOccasion;
  String? productNeck;
  String? productFabric;
  String? productWashCare;
  String? productSustainable;
  String? status;
  String? approvedBy;
  String? ownerId;
  String? finalApprovedBy;
  String? category;
  String? productGender;
  String? productMrp;
  int? productPrice;
  String? productCoin;
  DateTime? productCoinCreatedAt;
  DateTime? productCoinUpdatedAt;
  String? productDiscountInPercentage;
  String? productDiscountInAmount;
  String? productDepreciationRate;
  String? productDepreciationTenture;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Info>? ownerInfo;
  List<Info>? selectorInfo;
  List<Info>? fashionHeadInfo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        inFavorite: json["inFavorite"],
        inWardrobe: json["inWardrobe"],
        id: json["_id"],
        productImageUrl:
            List<String>.from(json["productImageUrl"].map((x) => x)),
        isDeleted: json["isDeleted"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        productBrand: json["productBrand"],
        productColor: json["productColor"],
        productType: json["productType"],
        productPattern: json["productPattern"],
        productSleeveLength: json["productSleeveLength"],
        productOccasion: json["productOccasion"],
        productNeck: json["productNeck"],
        productFabric: json["productFabric"],
        productWashCare: json["productWashCare"],
        productSustainable: json["productSustainable"],
        status: json["status"],
        approvedBy: json["approvedBy"] == null ? null : json["approvedBy"],
        ownerId: json["ownerId"],
        finalApprovedBy:
            json["finalApprovedBy"] == null ? null : json["finalApprovedBy"],
        category: json["category"],
        productGender: json["productGender"],
        productMrp: json["productMRP"],
        productPrice: json["productPrice"],
        productCoin: json["productCoin"],
        productCoinCreatedAt: DateTime.parse(json["productCoinCreatedAt"]),
        productCoinUpdatedAt: DateTime.parse(json["productCoinUpdatedAt"]),
        productDiscountInPercentage: json["productDiscountInPercentage"],
        productDiscountInAmount: json["productDiscountInAmount"],
        productDepreciationRate: json["productDepreciationRate"],
        productDepreciationTenture: json["productDepreciationTenture"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        ownerInfo:
            List<Info>.from(json["owner_info"].map((x) => Info.fromJson(x))),
        selectorInfo:
            List<Info>.from(json["selector_info"].map((x) => Info.fromJson(x))),
        fashionHeadInfo: List<Info>.from(
            json["fashion_head_info"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "inFavorite": inFavorite,
        "inWardrobe": inWardrobe,
        "_id": id,
        "productImageUrl": List<dynamic>.from(productImageUrl!.map((x) => x)),
        "isDeleted": isDeleted,
        "productName": productName,
        "productDescription": productDescription,
        "productBrand": productBrand,
        "productColor": productColor,
        "productType": productType,
        "productPattern": productPattern,
        "productSleeveLength": productSleeveLength,
        "productOccasion": productOccasion,
        "productNeck": productNeck,
        "productFabric": productFabric,
        "productWashCare": productWashCare,
        "productSustainable": productSustainable,
        "status": status,
        "approvedBy": approvedBy == null ? null : approvedBy,
        "ownerId": ownerId,
        "finalApprovedBy": finalApprovedBy == null ? null : finalApprovedBy,
        "category": category,
        "productGender": productGender,
        "productMRP": productMrp,
        "productPrice": productPrice,
        "productCoin": productCoin,
        "productCoinCreatedAt": productCoinCreatedAt!.toIso8601String(),
        "productCoinUpdatedAt": productCoinUpdatedAt!.toIso8601String(),
        "productDiscountInPercentage": productDiscountInPercentage,
        "productDiscountInAmount": productDiscountInAmount,
        "productDepreciationRate": productDepreciationRate,
        "productDepreciationTenture": productDepreciationTenture,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "owner_info": List<dynamic>.from(ownerInfo!.map((x) => x.toJson())),
        "selector_info":
            List<dynamic>.from(selectorInfo!.map((x) => x.toJson())),
        "fashion_head_info":
            List<dynamic>.from(fashionHeadInfo!.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    this.id,
    this.address,
    this.email,
    this.firstName,
    this.lastName,
  });

  String? id;
  Address? address;
  String? email;
  String? firstName;
  String? lastName;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["_id"],
        address: Address.fromJson(json["address"]),
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address!.toJson(),
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class Address {
  Address({
    this.flat,
    this.landmark,
    this.pincode,
    this.city,
    this.state,
  });

  String? flat;
  String? landmark;
  String? pincode;
  String? city;
  String? state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        flat: json["flat"],
        landmark: json["landmark"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "flat": flat,
        "landmark": landmark,
        "pincode": pincode,
        "city": city,
        "state": state,
      };
}
