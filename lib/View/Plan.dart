import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/Api_service.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Address.dart';
import 'package:snugggle/View/BottomBar.dart';

import '../Model/plan model.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: comColor,
          title: Text("SNUGGLE"),
          centerTitle: true),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Text(
              "Plan we offer",
              style: TextStyle(fontSize: 18.sp, color: Color(0xff3D3D3D)),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          PlanBox(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomBar(),
                        ));
                  },
                  child: Text(
                    "Skip for Now >",
                    style: TextStyle(
                        color: comColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlanBox extends StatefulWidget {
  const PlanBox({Key? key}) : super(key: key);

  @override
  State<PlanBox> createState() => _PlanBoxState();
}

class _PlanBoxState extends State<PlanBox> {
  List color = [Color(0xff181059), Color(0xff5BAB40), comColor];
  List containerCol = [Color(0xff8645FF), comColor, comColor];
  List borderCol = [Colors.transparent, Colors.transparent, Colors.white];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      child: FutureBuilder(
        future: ApiService.planApi(),
        builder: (BuildContext context, AsyncSnapshot<PlanData?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 430.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        color: color[index],
                        borderRadius: BorderRadius.circular(24.h)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${data.planName}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: 77.w,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Save",
                                      style: TextStyle(
                                          color: comColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Icon(Icons.currency_rupee,
                                        size: 16.h, color: comColor),
                                    Text(
                                      "${data.planOffer}",
                                      style: TextStyle(
                                          color: comColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 27.0),
                            child: Column(
                              children: [
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
                                        "${data.plansDetails![0]}",
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
                                        "${data.plansDetails![1]}",
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
                                        "${data.plansDetails![2]}",
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
                                        "${data.plansDetails![3]}",
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
                                        "${data.planDescription}",
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
                                  height: 24.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee,
                                            color: Colors.white),
                                        Text(
                                          "${data.planPrice}",
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Address(),
                                        ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 48.h,
                                    width: 212.w,
                                    decoration: BoxDecoration(
                                        color: containerCol[index],
                                        border: Border.all(
                                            color: borderCol[index], width: 2),
                                        borderRadius:
                                            BorderRadius.circular(16.h)),
                                    child: Text(
                                      "Choose",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
