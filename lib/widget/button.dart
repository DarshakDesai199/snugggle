import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String? name;

  const Button({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 63.h,
      width: 318.h,
      decoration: BoxDecoration(
          color: Color(0xffFF3F00),
          borderRadius: BorderRadius.circular(31.5.h)),
      child: Text(
        '$name',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
