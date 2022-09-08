import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';

class PauseMemberShip extends StatefulWidget {
  const PauseMemberShip({Key? key}) : super(key: key);

  @override
  State<PauseMemberShip> createState() => _PauseMemberShipState();
}

class _PauseMemberShipState extends State<PauseMemberShip> {
  List<dynamic> reason = [
    'other',
    'marriage',
    'hospital',
    'genuine'
  ]; // Option 2
  dynamic selectedReason = 'other';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: comColor,
          title: Text("Pause Membership")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                "assets/pause.png",
                height: 233.h,
                width: 352.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.h,
              ),
              Flexible(
                child: Text(
                  "Do you want to pause\nthe service?",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi aliquam arcu tortor arcu amet amet, nisi. Netus odio consequat mauris aliquet erat. Ullamcorper nisl viverra velit porttitor purus, quis suspendisse. Donec risus, in suscipit in sed a faucibus.''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555555))),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.snackbar("Membership Pause", "Successfully",
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 256.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(color: comColor)),
                  child: Text(
                    "Yes, pause my service",
                    style:
                        TextStyle(color: comColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: 256.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(color: Color(0xff8E8E8E))),
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Color(0xff555555), fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {
                  buildShowDialog(context);
                },
                child: Text(
                  "Cancel Membership",
                  style: TextStyle(fontSize: 15.sp, color: comColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 30.h,
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cancel Membership",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Please select your reason to leave",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(0xff626262),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 46.h,
                      width: 302.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffDDDDDD)),
                          borderRadius: BorderRadius.circular(8.h)),
                      child: DropdownButton(
                        hint: const Text(
                            'Please choose a location'), // Not necessary for Option 1
                        value: selectedReason,
                        onChanged: (value) {
                          setState(() {
                            selectedReason = value;
                          });
                        },
                        items: reason.map(
                          (e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      cursorColor: const Color(0xffF0C742),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* required';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'please mention a Results',
                        fillColor: Color(0xffDDDDDD),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF0C742)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffF0C742),
                          ),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 158.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
                              border: Border.all(color: comColor)),
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                                color: comColor, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "T & C",
                          style: TextStyle(fontSize: 15.sp, color: comColor),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          Get.snackbar("Membership Cancel", "Successfully",
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        child: Text(
                          "Cancel Membership",
                          style: TextStyle(fontSize: 15.sp, color: comColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
