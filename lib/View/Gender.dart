import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Plan.dart';

class Gender extends StatefulWidget {
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  List<String> gender = ['Male', 'Female'];
  var selectedGender = 'Male';
  List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];
  var selectedSize = 'S';
  List<String> prefrence = ['Tighter', 'Perfect', 'Looser'];
  var selectedPrefrence = 'Tighter';
  void getUserData() async {
    final user = await FirebaseFirestore.instance
        .collection("info")
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .get();
    Map<String, dynamic>? getUserData = user.data() as Map<String, dynamic>?;
    name.text = getUserData!['Name'];
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffFF3F00),
          title: Text("Finishing registration")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 31.h,
                ),
                Text(
                  "Name",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a Name";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "What is your Gender ? ",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Please choose your Gender, This will be used\nto identify your needs.",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 58.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedGender,
                      hint: Text("Country"),
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                      isExpanded: true,
                      iconSize: 32,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: gender.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: TextStyle(fontSize: 18.sp)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "What’s my size",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 58.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedSize,
                      hint: Text("Country"),
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                      isExpanded: true,
                      iconSize: 32,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: size.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: TextStyle(fontSize: 18.sp)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSize = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Preference",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "How do you want to fit ?",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 58.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedPrefrence,
                      hint: Text("Country"),
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                      isExpanded: true,
                      iconSize: 32,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: prefrence.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: TextStyle(fontSize: 18.sp)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPrefrence = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection("info")
                        .doc(kFirebaseAuth.currentUser!.uid)
                        .update({
                      "Name": name.text,
                      "Gender": selectedGender,
                      "Size": selectedSize,
                      "Preference": selectedPrefrence,
                    }).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Plan(),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        border: Border.all(
                          color: Color(0xffFF3F00),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Color(0xffFF3F00), fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
