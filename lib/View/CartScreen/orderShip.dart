import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';

class OrderShip extends StatefulWidget {
  const OrderShip({Key? key}) : super(key: key);

  @override
  State<OrderShip> createState() => _OrderShipState();
}

class _OrderShipState extends State<OrderShip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: comColor,
        title: Text(
          "Track Order",
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 110.h,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 28.r,
                              backgroundColor: comColor,
                              child: Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: comColor,
                                  image: DecorationImage(
                                    image: AssetImage("assets/orderPlace.png"),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: comColor,
                              ),
                            ),
                            CircleAvatar(
                              radius: 28.r,
                              backgroundColor: comColor,
                              child: Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: comColor,
                                  image: DecorationImage(
                                    image: AssetImage("assets/Vector (1).png"),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffD4D4D4),
                              ),
                              child: Icon(Icons.check,
                                  color: Colors.white, size: 30.h),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Placed",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff555555)),
                          ),
                          Text(
                            "In Transit",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff555555)),
                          ),
                          Text(
                            "Completed",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff555555)),
                          ),
                        ]),
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
