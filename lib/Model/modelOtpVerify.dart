class OtpVerify {
  String? otp;
  String? fcmToken;

  OtpVerify({this.otp, this.fcmToken});

  OtpVerify.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}
