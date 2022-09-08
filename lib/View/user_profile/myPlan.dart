import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Controller/myPlanController.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Plan.dart';
import 'package:snugggle/View/user_profile/pauseMembership.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  MyPlanController myPlanController = Get.put(MyPlanController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xffFF3F00),
          title: Text("MyPlan")),
      body: Obx(() {
        if (myPlanController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Subscribe",
                      style: TextStyle(fontSize: 19.h),
                    )),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 470.h,
                        width: 260.w,
                        decoration: BoxDecoration(
                          color: Color(0xff181059),
                          borderRadius: BorderRadius.circular(24.h),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Basic Plan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check,
                                        color: Colors.white, size: 24.h),
                                    SizedBox(
                                      width: 15.33.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${myPlanController.myPlanList?.data!.plansDetails![0]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check,
                                        color: Colors.white, size: 24.h),
                                    SizedBox(
                                      width: 15.33.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${myPlanController.myPlanList?.data!.plansDetails![1]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check,
                                        color: Colors.white, size: 24.h),
                                    SizedBox(
                                      width: 15.33.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${myPlanController.myPlanList?.data!.plansDetails![2]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check,
                                        color: Colors.white, size: 24.h),
                                    SizedBox(
                                      width: 15.33.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${myPlanController.myPlanList?.data!.plansDetails![3]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.close,
                                        color: Colors.white.withOpacity(0.4),
                                        size: 24.h),
                                    SizedBox(
                                      width: 15.33.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${myPlanController.myPlanList!.data!.planDescription}",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee,
                                            color: Colors.white),
                                        Text(
                                          "${myPlanController.myPlanList!.data!.planPrice}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      " /month",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Container(
                                  height: 52.h,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade700,
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Expire on",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.h,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "9th Oct 2021",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.h,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.h,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: comColor,
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Text(
                                    "Renew Plan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.h),
                            color: Color(0xff5BAB40),
                          ),
                          child: Text(
                            "Subscribed",
                            style: TextStyle(
                                fontSize: 15.h,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Plan());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 256.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        border: Border.all(color: comColor)),
                    child: Text(
                      "Change Plan",
                      style: TextStyle(
                          color: comColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(PauseMemberShip());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 256.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        border: Border.all(color: Color(0xff8E8E8E))),
                    child: Text(
                      "Pause Membership",
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "More Option",
                      style: TextStyle(fontSize: 15.sp, color: comColor),
                    )),
              ],
            ),
          );
        }
      }),
    );
  }
}
