import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snugggle/Services/const.dart';

import 'AvailableFavoriteScreen.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List tab = ['Available', 'Not Available'];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            indicatorColor: comColor,
            labelColor: comColor,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.symmetric(vertical: 5.h),
            labelStyle: TextStyle(fontSize: 18.sp),
            physics: PageScrollPhysics(),
            tabs: List.generate(
              tab.length,
              (index) => Text(
                "${tab[index]}",
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [AvailableFavoriteScreen(), AvailableFavoriteScreen()],
            ),
          )
        ],
      ),
    );
  }
}
