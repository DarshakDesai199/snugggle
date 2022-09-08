import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/BottomBar.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: comColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Payment Confirmation",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
            ),
            Center(
              child: Container(
                height: 219.h,
                width: 219.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/payment.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Payment Successfully",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3D3D3D)),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              "Thanks for the payment\nTransaction Number : 1234567890",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Rs.1823",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              'Payed by',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff787878)),
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              "Google Pay",
              style: TextStyle(
                  fontSize: 22.sp,
                  color: Color(0xff2E2E2E),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 37.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45.h,
                  width: 158.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      border: Border.all(color: Color(0xffFF3F00))),
                  child: Text(
                    "Let's go",
                    style: TextStyle(color: Color(0xffFF3F00), fontSize: 18.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
