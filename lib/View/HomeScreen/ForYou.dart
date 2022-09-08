import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snugggle/Controller/forYouController.dart';
import 'package:snugggle/Model/FavoriteAddModel.dart';
import 'package:snugggle/Model/favoriteRemoveModel.dart';
import 'package:snugggle/Model/wardrobeAddModel.dart';
import 'package:snugggle/Model/wardrobeRemoveModel.dart';
import 'package:snugggle/Services/Api_service.dart';

class ForYou extends StatefulWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  ForYouController forYouController = Get.put(ForYouController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (forYouController.isLoading.value) {
          var dataLength = forYouController.bannerList?.data?.data?.length;
          return SizedBox(
            height: 200.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataLength,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 300.h),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 200.h,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          height: 100.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.h),
                                bottomRight: Radius.circular(15.h)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: forYouController.bannerList?.data?.data?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 330.h),
            itemBuilder: (BuildContext context, int index) {
              var data = forYouController.bannerList!.data!.data![index];
              return Card(
                elevation: 4,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.h),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Container(
                          height: 200.h,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            image: DecorationImage(
                                image: NetworkImage(data.productImageUrl![0]),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () async {
                                  favoriteAddModel addData = favoriteAddModel();
                                  favoriteRemoveModel removeData =
                                      favoriteRemoveModel();

                                  setState(
                                    () {
                                      data.inFavorite = !data.inFavorite!;
                                    },
                                  );
                                  if (data.inFavorite == true) {
                                    addData.productId = data.id;
                                    addData.quantity = 1.toString();
                                    await ApiService.favoriteAddService(
                                        addData.toJson());
                                  } else {
                                    removeData.productId = data.id;
                                    await ApiService.favoriteRemoveService(
                                        removeData.toJson());
                                  }
                                },
                                child: data.inFavorite == true
                                    ? Icon(Icons.favorite,
                                        size: 30.h, color: Colors.red)
                                    : Icon(Icons.favorite_border,
                                        size: 30.h, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.h),
                            bottomRight: Radius.circular(15.h)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "${data.productName}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ...List.generate(
                                      4,
                                      (index) => Icon(
                                        Icons.star,
                                        size: 12.h,
                                        color: Color(0xffEA6428),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data.productBrand}",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Row(
                                  children: [
                                    Text("${data.productMrp}"),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Icon(
                                        Icons.monetization_on_outlined,
                                        size: 15.h,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  wardrobeAddModel addCart = wardrobeAddModel();
                                  wardrobeRemoveModel removeCart =
                                      wardrobeRemoveModel();
                                  setState(() {
                                    data.inWardrobe = !data.inWardrobe!;
                                  });
                                  if (data.inWardrobe == true) {
                                    addCart.productId = data.id;
                                    addCart.quantity = 1.toString();
                                    await ApiService.wardrobeAddService(
                                        reqBody: addCart.toJson());
                                  } else {
                                    removeCart.productId = data.id;
                                    await ApiService.wardrobeRemoveService(
                                        reqBody: removeCart.toJson());
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: data.inWardrobe == true
                                              ? Colors.red
                                              : Colors.green,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                    child: data.inWardrobe == true
                                        ? Text(
                                            "Remove",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.red),
                                          )
                                        : Text(
                                            "Add",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.green),
                                          )),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
