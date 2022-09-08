import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snugggle/Model/modelOtpSend.dart';
import 'package:snugggle/Services/Api_service.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/Services/google_service.dart';
import 'package:snugggle/View/Gender.dart';
import 'package:snugggle/View/OTP%20screen.dart';
import 'package:snugggle/widget/button.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final formKey = GlobalKey<FormState>();
  final _mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 93.h,
              ),
              Center(
                child: Container(
                  height: 84.h,
                  width: 84.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logos_apptentive.png"))),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Text(
                'Login in to snuggle',
                style: GoogleFonts.rowdies(
                  textStyle: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xffFF3F00),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 67.h,
                      width: 67.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/facebook.png"))),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await signInWithGoogle();
                      storage.write("mobile", email);
                      FirebaseFirestore.instance
                          .collection("info")
                          .doc(kFirebaseAuth.currentUser!.uid)
                          .set(
                        {
                          "Name": name,
                          "Gender": "",
                          "Size": "",
                          "Preference": "",
                          "Mobile": "",
                          "Email": email,
                          "Address": '',
                          "Landmark": '',
                          "PIN": '',
                          "City": '',
                          'State': '',
                          "Image": imageUrl
                        },
                      ).whenComplete(() => Get.off(Gender()));
                    },
                    child: Container(
                      height: 67.h,
                      width: 67.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Google.png"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white)),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "Or",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          color: Color(0xff878787),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(child: Divider(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Mobile #",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 63.h,
                width: 318.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31.5.h),
                    border: Border.all(color: Color(0xff4E4E4E)),
                    color: Color(0xff3E3E3E).withOpacity(0.5)),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 61.w,
                      child: Text(
                        "+91",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a Mobile Number";
                            }
                          },
                          controller: _mobile,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              counterText: "",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      OtpSend model = OtpSend();
                      model.fcmToken = "abcedhkjashfkasdasdsdfsdfsdfsdfsdfsdf";
                      model.mobileNumber = _mobile.text;
                      int? status =
                          await ApiService.sendOtp(reqBody: model.toJson());
                      if (status == 1) {
                        FirebaseFirestore.instance
                            .collection("info")
                            .doc(kFirebaseAuth.currentUser!.uid)
                            .update({"Mobile": _mobile.text});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpScreen(Mobile: _mobile.text),
                          ),
                        );
                      }
                    }
                  },
                  child: Button(
                    name: "Request OTP",
                  )),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have trouble logging in?",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Get help",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Color(0xffFF3F00),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
