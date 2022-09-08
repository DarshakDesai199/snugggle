import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/Services/google_service.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  FocusNode focusNode = FocusNode();

  var inputDecoration = InputDecoration(
    border: OutlineInputBorder(borderSide: BorderSide.none),
  );
  var textStyle = TextStyle(
      fontSize: 14.sp, color: Color(0xff3D3D3D), fontWeight: FontWeight.w600);
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _mobile = TextEditingController();
  final _email = TextEditingController();
  final _mesurment = TextEditingController();
  final _address = TextEditingController();
  final _landmark = TextEditingController();
  final _pin = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  ImagePicker picker = ImagePicker();
  File? image;

  Future getGalleryImage() async {
    var data = await picker.getImage(source: ImageSource.gallery);
    if (data != null) {
      setState(() {
        image = File(data.path);
        print('lllllll:-${image!.path}');
      });
    }
  }

  Future getCameraImage() async {
    var data = await picker.getImage(source: ImageSource.camera);
    if (data != null) {
      setState(() {
        image = File(data.path);
      });
    }
  }

  Future<String?> uploadFile({File? file, String? filename}) async {
    print("File path:$file");

    try {
      var response = await FirebaseStorage.instance
          .ref("user_image/$filename")
          .putFile(file!);

      var data =
          await response.storage.ref("user_image/$filename").getDownloadURL();
      return data;
    } on firebase_storage.FirebaseException catch (e) {
      print("ERROR===>>$e");
    }
    return null;
  }

  Future uploadData() async {
    String? userImage =
        await uploadFile(file: image, filename: "${Random().nextInt(100)}");

    FirebaseFirestore.instance
        .collection("info")
        .doc(kFirebaseAuth.currentUser!.uid)
        .update({
      "Name": _name.text,
      "Size": _mesurment.text,
      "Mobile": _mobile.text,
      "Email": _email.text,
      "Address": _address.text,
      "Landmark": _landmark.text,
      "PIN": _pin.text,
      "City": _city.text,
      'State': _state.text,
      "Image": userImage ?? imageUrl
    });
    print("$Img");
  }

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
    _name.text = getUserData!['Name'];
    _mobile.text = getUserData['Mobile'];
    _email.text = getUserData['Email'];
    _mesurment.text = getUserData['Size'];
    _address.text = getUserData['Address'];
    _landmark.text = getUserData['Landmark'];
    _pin.text = getUserData['PIN'];
    _city.text = getUserData['City'];
    _state.text = getUserData['State'];
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
        title: Text("Personal Profile"),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  buildShowDialog(context);
                }
              },
              icon: Icon(Icons.check),
              iconSize: 26.h),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: 129.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: image == null
                                ? Image.network(
                                    Img ??
                                        "https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg",
                                    fit: BoxFit.cover)
                                : Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: 270.w,
                                        height: 50.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: comColor),
                                          onPressed: () {
                                            getCameraImage();
                                            Get.back();
                                          },
                                          child: Text(
                                            "Camera",
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: 270.w,
                                        height: 50.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: comColor),
                                          onPressed: () {
                                            getGalleryImage();
                                            Get.back();
                                          },
                                          child: Text(
                                            "Gallery",
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: comColor,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Icon(Icons.camera_alt, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    "My Information",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Name",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your name";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Mobile",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _mobile,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Mobile no.";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Email",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Email";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "My Size",
                    style: textStyle,
                  ),
                  Text(
                    "Measurement",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your name";
                        }
                      },
                      controller: _mesurment,
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Address",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Flat/Street",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _address,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Address";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Landmark (optional)",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _landmark,
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "PIN",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _pin,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your PIN";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "City",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _city,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your city";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "State",
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 45.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffDDDDDD),
                        borderRadius: BorderRadius.circular(8.h)),
                    child: TextFormField(
                      controller: _state,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your state";
                        }
                      },
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Center(
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.h)),
              actions: [
                SizedBox(height: 20.h),
                Text(
                  "Request for remeasurement?",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3D3D3D),
                  ),
                ),
                SizedBox(height: 15.h),
                Center(
                  child: Text(
                    "We will take by coming delivery",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    await uploadData().whenComplete(() => Get.snackbar(
                        "update", "successfully",
                        snackPosition: SnackPosition.BOTTOM));
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: 108.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          border: Border.all(color: comColor)),
                      child: Text("Yes", style: TextStyle(color: comColor)),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: 108.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          border: Border.all(color: comColor)),
                      child: Text("Cancel", style: TextStyle(color: comColor)),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
