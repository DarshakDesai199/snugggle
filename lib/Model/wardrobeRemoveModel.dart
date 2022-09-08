class wardrobeRemoveModel {
  String? productId;

  wardrobeRemoveModel({this.productId});

  wardrobeRemoveModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    return data;
  }
}
