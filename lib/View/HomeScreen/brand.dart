import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snugggle/Controller/brandController.dart';

class Brand extends StatefulWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  BrandController brandController = Get.put(BrandController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Obx(
            () {
              var dataLength = brandController.brandList?.data?.brands?.length;

              if (brandController.isLoading.value) {
                return SizedBox(
                  height: 70.h,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataLength,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.h),
                            child: Container(
                              height: 200.h,
                              width: 125.w,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: 70.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brandController.brandList!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data =
                          brandController.brandList!.data!.brands![index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.h),
                          child: Image.network(
                            data.brandImageUrl![0],
                            height: 200.h,
                            width: 125.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
