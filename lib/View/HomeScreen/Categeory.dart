import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snugggle/Controller/categoryController.dart';

class BrandCategory extends StatefulWidget {
  const BrandCategory({Key? key}) : super(key: key);

  @override
  State<BrandCategory> createState() => _BrandCategoryState();
}

class _BrandCategoryState extends State<BrandCategory> {
  CategoryController categoryController = Get.put(CategoryController());
  List<Map<String, dynamic>> categoryType = [
    {
      'image': 'assets/tshirt.png',
      'color': Color(0xffE7D5E3),
    },
    {
      'image': 'assets/trouser.png',
      'color': Color(0xffE5DFD1),
    },
    {
      'image': 'assets/Shirt.png',
      'color': Color(0xffAAF7FF),
    },
    {
      'image': 'assets/shorts.png',
      'color': Color(0xffB6B7BD),
    },
    {
      'image': 'assets/trouser.png',
      'color': Color(0xffE5DFD1),
    },
    {
      'image': 'assets/tshirt.png',
      'color': Color(0xffE7D5E3),
    },
    {
      'image': 'assets/shorts.png',
      'color': Color(0xffB6B7BD),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var dataLength = categoryController.categoryList?.data?.length;
        if (categoryController.isLoading.value) {
          return SizedBox(
            height: 200.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataLength,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: Container(
                      height: 170.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
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
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.categoryList!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data =
                    categoryController.categoryList!.data!.category![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Container(
                    height: 170.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.h),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(2, 2))
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("${categoryType[index]['image']}"),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: categoryType[index]['color'],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.h),
                              bottomRight: Radius.circular(15.h),
                            ),
                          ),
                          child: Text(
                            "${data.catType}",
                            style: TextStyle(
                              fontSize: 17.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
