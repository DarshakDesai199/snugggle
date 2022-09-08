import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/BottomBar.dart';
import 'package:snugggle/View/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  var mobileData;
  void initState() {
    getData().whenComplete(
      () => Timer(
        Duration(seconds: 3),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                mobileData == null ? Onboarding() : BottomBar(),
          ),
        ),
      ),
    );
    super.initState();
  }

  Future getData() async {
    var data = await storage.read("mobile");
    setState(() {
      mobileData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Snuggle",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 38.sp,
                color: Color(0xffFF3F00),
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
