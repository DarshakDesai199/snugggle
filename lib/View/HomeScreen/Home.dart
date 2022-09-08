import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/HomeScreen/All%20brand.dart';
import 'package:snugggle/View/HomeScreen/Categeory.dart';
import 'package:snugggle/View/HomeScreen/ForYou.dart';
import 'package:snugggle/View/HomeScreen/banner.dart';
import 'package:snugggle/View/HomeScreen/brand.dart';

import 'All Category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Banners(),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More than 25 brands available",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(AllBrand());
                    },
                    child: Text(
                      "More",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: comColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Brand(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(AllCategory());
                    },
                    child: Text(
                      "More",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: comColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            BrandCategory(),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "For You",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(height: 550.h, child: ForYou()),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
