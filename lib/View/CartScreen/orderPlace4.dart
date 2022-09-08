import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/CartScreen/orderConfirmed.dart';
import 'package:snugggle/View/CartScreen/orderFailed.dart';

class OrderPlace4 extends StatefulWidget {
  const OrderPlace4({Key? key}) : super(key: key);

  @override
  State<OrderPlace4> createState() => _OrderPlace4State();
}

class _OrderPlace4State extends State<OrderPlace4>
    with SingleTickerProviderStateMixin {
  List tabs = ['Sunday', 'Monday'];
  List time = ['9am - 10am', '2pm - 6pm', '8pm - 10pm'];
  var selected = 0;
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: comColor,
        title: Text(
          "Select timeslots",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weekdays",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 50.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  border: Border.all(
                    color: const Color(0xffE7E7E7),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.h),
                  child: TabBar(
                      controller: tabController,
                      labelPadding: EdgeInsets.symmetric(vertical: 10.h),
                      labelColor: comColor,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.h),
                          color: Color(0xffFFE6DE)),
                      unselectedLabelColor: Color(0xffB3B3B3),
                      tabs: [
                        ...List.generate(
                            tabs.length, (index) => Text("${tabs[index]}"))
                      ]),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 110.h,
                child: GridView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 46.h,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          border: Border.all(
                            width: 1.8.h,
                            color: selected == index
                                ? comColor
                                : Color(0xffE7E7E7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${time[index]}",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: selected == index
                                    ? Colors.black
                                    : Color(0xff555555),
                                fontWeight: selected == index
                                    ? FontWeight.w800
                                    : FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Text(
                "Weekdays",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 50.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  border: Border.all(
                    color: const Color(0xffE7E7E7),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.h),
                  child: TabBar(
                      controller: tabController,
                      labelPadding: EdgeInsets.symmetric(vertical: 10.h),
                      labelColor: comColor,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.h),
                          color: Color(0xffFFE6DE)),
                      unselectedLabelColor: Color(0xffB3B3B3),
                      tabs: [
                        ...List.generate(
                            tabs.length, (index) => Text("${tabs[index]}"))
                      ]),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 110.h,
                child: GridView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 46.h,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          border: Border.all(
                            width: 1.8.h,
                            color: selected == index
                                ? comColor
                                : Color(0xffE7E7E7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${time[index]}",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: selected == index
                                    ? Colors.black
                                    : Color(0xff555555),
                                fontWeight: selected == index
                                    ? FontWeight.w800
                                    : FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog();
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        border: Border.all(color: comColor)),
                    child: Text("Finish",
                        style: TextStyle(color: comColor, fontSize: 18.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dialog extends StatefulWidget {
  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  List button = ['Back', 'Yes'];

  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Center(
        child: Column(
          children: [
            Text(
              "Confirm Order",
              style: TextStyle(color: Color(0xff626262), fontSize: 16.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Please confirm my order.",
              style: TextStyle(
                  color: Color(0xff626262),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
            ),
          ],
        ),
      ),
      actions: [
        ...List.generate(
          button.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 30.h),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
                if (index == 0) {
                  Get.back();

                  Get.to(OrderFailed());
                } else {
                  Get.back();

                  Get.to(OrderConfirmed());
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                width: 92.h,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            selected == index ? comColor : Colors.transparent),
                    borderRadius: BorderRadius.circular(8.h)),
                child: Text(
                  "${button[index]}",
                  style: TextStyle(color: comColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
