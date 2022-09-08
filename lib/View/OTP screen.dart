import 'package:flutter/material.dart';
import 'package:snugggle/Model/modelOtpVerify.dart';
import 'package:snugggle/Services/Api_service.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Gender.dart';
import 'package:snugggle/widget/button.dart';

class OtpScreen extends StatefulWidget {
  final String? Mobile;

  const OtpScreen({super.key, this.Mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final otp = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid Otp";
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    controller: otp,
                    maxLength: 6,
                    decoration: InputDecoration(
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      OtpVerify _model = OtpVerify();
                      _model.fcmToken = "abcedhkjashfkasdasdsdfsdfsdfsdfsdfsdf";
                      _model.otp = otp.text;
                      int? status =
                          await ApiService.otpVerify(reqBody: _model.toJson());
                      if (status == 1) {
                        storage.write("mobile", otp.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Gender(),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Invalid OTP"),
                        ),
                      );
                    }
                  },
                  child: Button(
                    name: "Submit",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
