import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snugggle/Model/wardrobeRemoveModel.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/CartScreen/orderPlace.dart';

import '../../Model/cartModel.dart';
import '../../Services/Api_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FloatingActionButton(
          backgroundColor: comColor,
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Get.to(OrderPlace());
          },
        ),
      ),
      body: FutureBuilder(
        future: ApiService.cartService(),
        builder: (BuildContext context, AsyncSnapshot<CartModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.data!.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 330.h,
                  crossAxisSpacing: 5.h,
                  mainAxisSpacing: 5.h),
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data!.data!.data![index];

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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.h),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      data.productData!.productImageUrl![0]),
                                  fit: BoxFit.cover),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "${data.productData!.productName}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${data.productData!.productBrand}",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  Row(
                                    children: [
                                      Text("${data.productData!.productMrp}"),
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
                                  onTap: () {
                                    wardrobeRemoveModel removeCart =
                                        wardrobeRemoveModel();
                                    removeCart.productId = data.id;
                                    ApiService.wardrobeRemoveService(
                                        reqBody: removeCart.toJson());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 2),
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.red),
                                    ),
                                  ),
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
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade300,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.data?.data?.length,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    height: 205.h,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                height: 105.h,
                                width: 180.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.h),
                                      bottomRight: Radius.circular(15.h)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 42.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                          ),
                                        ),
                                      ),
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
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
