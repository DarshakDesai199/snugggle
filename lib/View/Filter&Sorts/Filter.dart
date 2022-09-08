import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  List filter = [
    "Brand",
    'Colors',
    "Types",
    "Pattern",
    "sleeve length",
    "Occasion",
    "Neck",
    "Fabric",
    "Wash Care",
    "Sustainable"
  ];
  List Count = ['569', '322', '250', '195', '153', '056', '147', '099', '001'];
  List type = [
    'Plain',
    'Striped',
    'Graphics',
    'Oversized',
    'Polo',
    'Blue',
  ];

  List colorChoice = [
    'Black',
    'White',
    'Red',
    'Grey',
    'Purple',
    'Blue',
    'Green',
    'Yellow',
  ];
  List brandChoice = [
    'Levis',
    'Lee',
    'Red',
    'Tommy hilfiger',
    'Wrangler',
    'USP',
    'Jack & Jones',
    'Allen solly',
    'H & M'
  ];
  var selected = 0;
  var brandSelected = 0;
  var colorSelected = 0;
  var typeSelected = 0;
  PageController pageController = PageController(initialPage: 0);

  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(13.h));
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: Get.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.h),
                      bottomRight: Radius.circular(10.h)),
                  color: Colors.black87),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filter.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                              pageController.jumpToPage(index);
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                color: selected == index
                                    ? comColor
                                    : Colors.transparent,
                                height: 45.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    filter[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                              Divider(color: Colors.black),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: Get.height,
              child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    selected = value;
                  },
                  children: [
                    /// brands
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            children: [
                              ...List.generate(
                                brandChoice.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      brandSelected = index;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text(
                                          brandChoice[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: brandSelected == index
                                                  ? comColor
                                                  : Colors.black),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 16.h,
                                        width: 16.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            border: Border.all(
                                                color: brandSelected == index
                                                    ? comColor
                                                    : Colors.grey)),
                                        child: Icon(Icons.check,
                                            color: brandSelected == index
                                                ? comColor
                                                : Colors.transparent,
                                            size: 15.h),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(Count[index])
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Close"),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Apply"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),

                    /// Color
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            children: [
                              ...List.generate(
                                colorChoice.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      colorSelected = index;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text(
                                          colorChoice[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: colorSelected == index
                                                  ? comColor
                                                  : Colors.black),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 16.h,
                                        width: 16.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            border: Border.all(
                                                color: colorSelected == index
                                                    ? comColor
                                                    : Colors.grey)),
                                        child: Icon(Icons.check,
                                            color: colorSelected == index
                                                ? comColor
                                                : Colors.transparent,
                                            size: 15.h),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(Count[index])
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Close"),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Apply"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),

                    /// Types
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            children: [
                              ...List.generate(
                                type.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      typeSelected = index;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text(
                                          type[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: typeSelected == index
                                                  ? comColor
                                                  : Colors.black),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 16.h,
                                        width: 16.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            border: Border.all(
                                                color: typeSelected == index
                                                    ? comColor
                                                    : Colors.grey)),
                                        child: Icon(Icons.check,
                                            color: typeSelected == index
                                                ? comColor
                                                : Colors.transparent,
                                            size: 15.h),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(Count[index])
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Close"),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text("Apply"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 210.w,
                            height: 48.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: comColor),
                                hintText: "Search Brands",
                                focusedBorder: outlineInputBorder,
                                border: outlineInputBorder,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              "wait..",
                              style: TextStyle(fontSize: 15.h),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
