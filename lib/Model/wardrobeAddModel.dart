class wardrobeAddModel {
  String? productId;
  String? quantity;

  wardrobeAddModel({this.productId, this.quantity});

  wardrobeAddModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
