import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipecards/flutter_swipecards.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/Api_service.dart';
import 'package:snugggle/Services/const.dart';

import '../../Model/cartModel.dart';
import 'orderPlace4.dart';

class OrderPlace extends StatefulWidget {
  const OrderPlace({Key? key}) : super(key: key);

  @override
  State<OrderPlace> createState() => _OrderPlaceState();
}

class _OrderPlaceState extends State<OrderPlace> {
  List leftImage = [];
  List rightImage = [];
  CardController _cardController = CardController();

  bool rightSwipe = false;
  bool leftSwipe = false;
  int? totalRight;
  int? totalLeft;
  var left = 0;
  var right = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FloatingActionButton(
          backgroundColor: comColor,
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Get.to(OrderPlace4());
          },
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                color: comColor,
                icon: Icon(Icons.notification_important_rounded)),
            IconButton(
                onPressed: () {},
                color: comColor,
                icon: Icon(Icons.person_outline)),
          ],
          title: Text(
            "Wardrobe",
            style: TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Weekday Items",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 158.h,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: leftImage.length,
              itemBuilder: (context, index) {
                return leftImage.isEmpty
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 116.h,
                          width: 107.w,
                          margin: EdgeInsets.only(top: 18.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.h),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 2,
                                color: Colors.grey.shade300,
                              ),
                              BoxShadow(
                                offset: const Offset(-2, -2),
                                blurRadius: 2,
                                color: Colors.grey.shade300,
                              ),
                            ],
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Container(
                            height: 110.h,
                            width: 100.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.h),
                              image: DecorationImage(
                                  image: NetworkImage(leftImage[index]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            "Weekday Items",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 158.h,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rightImage.length,
              itemBuilder: (context, index) {
                return rightImage.isEmpty
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 116.h,
                          width: 107.w,
                          margin: EdgeInsets.only(top: 18.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.h),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 2,
                                color: Colors.grey.shade300,
                              ),
                              BoxShadow(
                                offset: const Offset(-2, -2),
                                blurRadius: 2,
                                color: Colors.grey.shade300,
                              ),
                            ],
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Container(
                            height: 110.h,
                            width: 100.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.h),
                              image: DecorationImage(
                                  image: NetworkImage(rightImage[index]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiService.cartService(),
              builder:
                  (BuildContext context, AsyncSnapshot<CartModel?> snapshot) {
                var data = snapshot.data?.data?.data;
                if (snapshot.hasData) {
                  if (data!.isNotEmpty) {
                    return TinderSwapCard(
                      cardController: _cardController,
                      totalNum: data.length,
                      stackNum: 2,
                      swipeEdge: 2.0,
                      maxWidth: 250.h,
                      maxHeight: 314.h,
                      minWidth: 249.h,
                      minHeight: 313.h,
                      cardBuilder: (context, index) => Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.h),
                          child: Image.network(
                            '${data[index].productData?.productImageUrl![0]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      swipeUpdateCallback:
                          (DragUpdateDetails details, Alignment align) {
                        if (align.x < 0) {
                          setState(() {
                            leftSwipe = true;
                            rightSwipe = false;
                          });
                        } else if (align.x > 0) {
                          setState(() {
                            leftSwipe = false;
                            rightSwipe = true;
                          });
                        }
                      },
                      swipeCompleteCallback:
                          (CardSwipeOrientation orientation, int index) {
                        if (leftSwipe) {
                          setState(() {
                            totalLeft = right + left;
                            setState(
                              () {
                                leftImage.add(data[totalLeft!]
                                    .productData
                                    ?.productImageUrl![0]);
                              },
                            );
                            left++;
                          });
                        } else {
                          totalRight = right + left;
                          setState(
                            () {
                              rightImage.add(data[totalRight!]
                                  .productData
                                  ?.productImageUrl![0]);
                            },
                          );
                          right++;
                        }
                      },
                    );
                  } else {
                    return Center(child: Text("WardRobe is Empty"));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
