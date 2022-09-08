import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  List data = [
    {"title": "What is Refer and Earn program?", "subtitle": "hello"},
    {'title': "How it works?", "subtitle": "hello"},
    {'title': "Where can I use these Loyalty Points?", "subtitle": "hello"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: comColor,
        title: Text("Refer & Earn"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                height: 460.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(59.h),
                    bottomLeft: Radius.circular(59.h),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/Rectangle 2253.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    "Refer your friend\n and earn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.h,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Image.asset(
                    "assets/gift.png",
                    fit: BoxFit.cover,
                    height: 114.h,
                    width: 114.h,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Invite a friend and get",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.h,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              " 300 ₹",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 23.h),
                            ),
                            Text(
                              " off",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.h,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Text(
                          "in your next month billing.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Container(
                    height: 69.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(color: Colors.white),
                        color: Colors.white24),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 13.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your referral code",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "AVDS231254",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: VerticalDivider(
                              thickness: 1, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Copy\nCode",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar("Copy Code", "Successfully",
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Container(
                    height: 40.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.h),
                        color: comColor),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            size: 22.h,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            "Share your code",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.sp),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "FAQS",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xff3D3D3D),
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: ExpansionTile(
                    title: Text(
                      data[index]['title'],
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['subtitle'],
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
