class OtpSend {
  String? fcmToken;
  String? mobileNumber;

  OtpSend({this.fcmToken, this.mobileNumber});

  OtpSend.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcmToken'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fcmToken'] = this.fcmToken;
    data['mobileNumber'] = this.mobileNumber;
    return data;
  }
}
