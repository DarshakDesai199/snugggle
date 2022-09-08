import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Payment.dart';

class ConfirmPlan extends StatefulWidget {
  const ConfirmPlan({Key? key}) : super(key: key);

  @override
  State<ConfirmPlan> createState() => _ConfirmPlanState();
}

class _ConfirmPlanState extends State<ConfirmPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: comColor,
        title: Text(
          "Confirm Plan",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 51.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DESCRIPTION",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffB3B3B3),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "SUBTOTAL",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffB3B3B3),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Divider(color: Color(0xffB3B3B3)),
                  SizedBox(
                    height: 17.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Golden plan one Year",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Security deposit",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Info about Security deposit",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xff9E9E9E),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(color: Color(0xffB3B3B3)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xffB3B3B3),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "2000",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Discount",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffB3B3B3),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "  12%",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        "240",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xffB3B3B3),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "65",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff261C1C),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Divider(color: Color(0xffB3B3B3)),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "GRAND TOTAL",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: comColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "RS. 1825",
                        style: TextStyle(
                            fontSize: 19.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 87.h,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rs. 1825",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "For 1 Month",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xffAEAEAE),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 48.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: comColor,
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.h,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
