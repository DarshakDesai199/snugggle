import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/View/CartScreen/orderShip.dart';

import '../../Services/const.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({Key? key}) : super(key: key);

  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/orederConfirmed.png"),
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
                  height: 40.h,
                ),
                Text(
                  "You can track your wardrobe order here",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff626262)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(OrderShip());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        border: Border.all(color: comColor)),
                    child: Text("Track Your Order",
                        style: TextStyle(color: comColor, fontSize: 16.sp)),
                  ),
                ),
                Spacer(),
                Container(
                  height: 60.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Color(0xffEDF1FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17.h),
                      topRight: Radius.circular(17.h),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/info.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(TextSpan(
                                  text:
                                      'You can make changes in your wardrobe in',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xff626262),
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                        text: " My\nWardrobe",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w900)),
                                    TextSpan(
                                      text: " selection till",
                                    ),
                                    TextSpan(
                                        text: " Friday",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w900))
                                  ]))
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
