import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Controller/brandController.dart';
import 'package:snugggle/Services/const.dart';

class AllBrand extends StatefulWidget {
  const AllBrand({Key? key}) : super(key: key);

  @override
  State<AllBrand> createState() => _AllBrandState();
}

class _AllBrandState extends State<AllBrand> {
  List brand = [
    'assets/raymond.png',
    'assets/nike.jpg',
    'assets/petere.jpg',
    'assets/adidas.jpg',
    'assets/puma.png',
    'assets/reebok.jpg'
  ];
  AllBrandController allBrandController = Get.put(AllBrandController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: comColor,
        title: Text("All Brand"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Obx(
                () {
                  // var dataLength =
                  //     allBrandController.allBrandList?.data?.length;

                  if (allBrandController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        itemCount:
                            allBrandController.allBrandList!.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 150,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (BuildContext context, int index) {
                          var data = allBrandController
                              .allBrandList!.data!.uniqueArray![index];
                          return Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("${brand[index]}"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${data}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.sp),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
