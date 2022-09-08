import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/Confirm%20plan.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final formKey = GlobalKey<FormState>();
  final _flat = TextEditingController();
  final _landmark = TextEditingController();
  final _pin = TextEditingController();
  final _city = TextEditingController();
  final _states = TextEditingController();

  Future uploadData() async {
    FirebaseFirestore.instance
        .collection("info")
        .doc(kFirebaseAuth.currentUser!.uid)
        .update({
      "Address": _flat.text,
      "Landmark": _landmark.text,
      "PIN": _pin.text,
      "City": _city.text,
      'State': _states.text,
    });
  }

  void getUserData() async {
    final user = await FirebaseFirestore.instance
        .collection("info")
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .get();
    Map<String, dynamic>? getUserData = user.data() as Map<String, dynamic>?;
    _flat.text = getUserData!['Address'];
    _landmark.text = getUserData['Landmark'];
    _pin.text = getUserData['PIN'];
    _city.text = getUserData['City'];
    _states.text = getUserData['State'];
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
      ),
    );
    var textStyle = TextStyle(fontSize: 12.sp);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Enter Address"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: comColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  "Address",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "Flat/Street",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: TextFormField(
                    controller: _flat,
                    validator: validator,
                    decoration: inputDecoration.copyWith(
                        hintText: "Flat/Street", hintStyle: textStyle),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "Landmark (optional)",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: TextFormField(
                    controller: _landmark,
                    validator: validator,
                    decoration: inputDecoration.copyWith(
                        hintText: "Landmark", hintStyle: textStyle),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "PIN",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: TextFormField(
                    controller: _pin,
                    validator: validator,
                    decoration: inputDecoration.copyWith(
                        hintText: "PIN", hintStyle: textStyle),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "City",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: TextFormField(
                    controller: _city,
                    validator: validator,
                    decoration: inputDecoration.copyWith(
                        hintText: "City", hintStyle: textStyle),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "States",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: TextFormField(
                    controller: _states,
                    validator: validator,
                    decoration: inputDecoration.copyWith(
                        hintText: "States", hintStyle: textStyle),
                  ),
                ),
                SizedBox(
                  height: 106.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await uploadData().whenComplete(
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmPlan(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h),
                          border: Border.all(color: Color(0xffFF3F00))),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Color(0xffFF3F00), fontSize: 18.sp),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validator(value) {
    if (value!.isEmpty) {
      return "required";
    }
  }
}
