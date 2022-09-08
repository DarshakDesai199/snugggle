import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/google_service.dart';
import 'package:snugggle/View/Login_Screen.dart';
import 'package:snugggle/View/user_profile/myPlan.dart';
import 'package:snugggle/View/user_profile/personalProfile.dart';
import 'package:snugggle/View/user_profile/refer&earn.dart';

import '../../Services/const.dart';
import '../Notification.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var Img;
  void getUserData() async {
    final user = await FirebaseFirestore.instance
        .collection("info")
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .get();
    Map<String, dynamic>? getUserData = user.data() as Map<String, dynamic>?;
    setState(() {
      Img = getUserData!['Image'];
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: comColor,
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notificaion(),
                    ));
              },
              icon: Icon(Icons.notifications)),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Text(
                "Hello",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 32.sp),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 129.h,
              width: 129.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    Img ??
                        "https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Personal(),
                        ));
                  },
                  leading: Icon(
                    Icons.person_outline,
                    size: 27.h,
                    color: comColor,
                  ),
                  title: Text(
                    "Personal Details",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color(0xff343434),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "Fill out your personal details here.",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                  onTap: () {
                    Get.to(MyPlan());
                  },
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    size: 27.h,
                    color: comColor,
                  ),
                  title: Text(
                    "My Plan",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color(0xff343434),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "If you not subscribed yet,do it.",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.card_travel,
                    size: 27.h,
                    color: comColor,
                  ),
                  title: Text(
                    "My Wardrobe",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color(0xff343434),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "Check out your current and last wardrobe.",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReferAndEarn(),
                        ));
                  },
                  leading: Icon(
                    Icons.mail_outline,
                    size: 27.h,
                    color: comColor,
                  ),
                  title: Text(
                    "Refer & Earn",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color(0xff343434),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "Check out your current and last wardrobe",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                  leading: Icon(
                    Icons.security,
                    size: 27.h,
                    color: comColor,
                  ),
                  title: Text(
                    "Our Standard",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Color(0xff343434),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
            Divider(),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                signOutGoogle();
                Get.off(Login_Screen());
                Get.snackbar("Log Out", "successfully");
              },
              child: Container(
                alignment: Alignment.center,
                height: 45.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff8E8E8E), width: 1.5),
                    borderRadius: BorderRadius.circular(5.h),
                    color: Colors.white),
                child: Text("LogOut",
                    style:
                        TextStyle(color: Color(0xff8E8E8E), fontSize: 15.sp)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
