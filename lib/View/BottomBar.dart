import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Controller/internet_controller.dart';
import 'package:snugggle/Services/const.dart';
import 'package:snugggle/View/CartScreen/AvaliableCartScreen.dart';
import 'package:snugggle/View/HomeScreen/Home.dart';
import 'package:snugggle/View/user_profile/profile.dart';

import 'FavoriteScreen/Favorite.dart';
import 'Filter&Sorts/F&S_Screen.dart';
import 'Notification.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List icon = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
  ];

  List selectedIcon = [
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
  ];

  List screen = [
    Home(),
    CartScreen(),
    Favorite(),
  ];

  List name = ["SNUGGLE", "Cart", "Favorite"];
  var bottomSelected = 0;

  ConnectivityProvider connectivityProvider = Get.put(ConnectivityProvider());
  @override
  void initState() {
    connectivityProvider.startMonitoring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: comColor,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(Notificaion());
                  },
                  icon: Icon(Icons.notification_important_rounded)),
              IconButton(
                  onPressed: () {
                    Get.to(Profile());
                  },
                  icon: Icon(Icons.person_outline)),
              IconButton(
                  onPressed: () {
                    Get.to(FilterAndSort());
                  },
                  icon: Icon(Icons.filter_alt_outlined)),
            ],
            title: Text(name[bottomSelected])),
        body: GetBuilder<ConnectivityProvider>(
          builder: (controller) {
            if (connectivityProvider.isOnline) {
              return screen[bottomSelected];
            } else {
              return Center(
                child: Text(
                  "No Internet",
                  style: TextStyle(color: comColor, fontSize: 18.sp),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 15.h, right: 15.h, left: 15.h),
          height: 65.h,
          width: 350.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: comColor, width: 2),
              borderRadius: BorderRadius.circular(15.h),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    offset: Offset(3, 3),
                    blurRadius: 5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        bottomSelected = index;
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: bottomSelected == index
                        ? Icon(
                            selectedIcon[index],
                            color: comColor,
                            size: 30.h,
                          )
                        : Icon(icon[index], color: comColor, size: 30.h),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
