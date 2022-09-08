import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snugggle/Controller/banner%20Controller.dart';
import 'package:snugggle/Services/const.dart';

class Banners extends StatefulWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  BannerController bannerController = Get.put(BannerController());
  BannerButtonController bannerButtonController =
      Get.put(BannerButtonController());
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            if (bannerController.isLoading.value) {
              return Center(
                child: SizedBox(
                  height: 200.h,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      height: 200.h,
                      width: 314.w,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              var data = bannerController.bannerList!.data!.banners;
              return SizedBox(
                height: 200.h,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: data!.length,
                  onPageChanged: (value) {
                    bannerButtonController.isPageValue(value);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.grey.shade400,
                            ),
                            BoxShadow(
                              offset: const Offset(-2, -2),
                              blurRadius: 4,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                        child: Image.network(
                          data[index].bannerImageUrl![0],
                          height: 170.h,
                          width: 314.w,
                        ));
                  },
                ),
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: GestureDetector(
                  onTap: () {
                    bannerButtonController.isPageChanged(index);
                  },
                  child: Obx(
                    () => bannerButtonController.pageSelected.value == index
                        ? Container(
                            height: 13.h,
                            width: 13.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: comColor,
                            ),
                          )
                        : Container(
                            height: 10.h,
                            width: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
