import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/View/Filter&Sorts/Filter.dart';
import 'package:snugggle/View/Filter&Sorts/Sorts.dart';

class FilterAndSort extends StatefulWidget {
  const FilterAndSort({Key? key}) : super(key: key);

  @override
  State<FilterAndSort> createState() => _FilterAndSortState();
}

class _FilterAndSortState extends State<FilterAndSort>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List item = ['Filter', 'Sorts'];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 15.h),
            indicator: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5.h)),
            labelColor: Colors.white,
            tabs: [
              ...List.generate(
                item.length,
                (index) => Text(
                  item[index],
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
                ),
              )
            ],
            controller: tabController,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.black,
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController, children: [Filter(), Sorts()]))
        ]),
      ),
    );
  }
}
