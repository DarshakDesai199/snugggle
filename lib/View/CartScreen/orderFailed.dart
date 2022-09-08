import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Services/const.dart';
import 'orderPlace4.dart';

class OrderFailed extends StatefulWidget {
  const OrderFailed({Key? key}) : super(key: key);

  @override
  State<OrderFailed> createState() => _OrderFailedState();
}

class _OrderFailedState extends State<OrderFailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/failed.png"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 30.h,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(OrderPlace4());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h),
                          border: Border.all(color: comColor)),
                      child: Text("Try again",
                          style: TextStyle(color: comColor, fontSize: 16.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Need help",
                        style: TextStyle(fontSize: 16.sp, color: comColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
