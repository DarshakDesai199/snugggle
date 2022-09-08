import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Services/const.dart';

class Sorts extends StatefulWidget {
  const Sorts({Key? key}) : super(key: key);

  @override
  State<Sorts> createState() => _SortsState();
}

class _SortsState extends State<Sorts> {
  List<String> sortMenu = [
    'Coins - High to low',
    'Coins - Low to high',
    'Popularity',
    'Ratings',
    'What’s new'
  ];
  var selectMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            ...List.generate(
              sortMenu.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectMenu = index;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        sortMenu[index],
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                selectMenu == index ? comColor : Colors.black),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: 16.h,
                      width: 16.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h),
                          border: Border.all(
                              color: selectMenu == index
                                  ? comColor
                                  : Colors.grey)),
                      child: Icon(Icons.check,
                          color: selectMenu == index
                              ? comColor
                              : Colors.transparent,
                          size: 15.h),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
