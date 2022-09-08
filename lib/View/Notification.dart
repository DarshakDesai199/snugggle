import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snugggle/Services/const.dart';

class Notificaion extends StatefulWidget {
  const Notificaion({Key? key}) : super(key: key);

  @override
  State<Notificaion> createState() => _NotificaionState();
}

class _NotificaionState extends State<Notificaion> {
  List<Map<String, dynamic>> recent = [
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur ',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam, quis nostrud exercitation ullamco laboris\nnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor\nin reprehenderit in voluptate velit esse cillum dolore eu fugiat\nnulla pariatur. Excepteur sint occaecat cupidatat non proident,\nsunt in culpa qui officia deserunt mollit anim id est laborum.\n'
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur ',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam, quis nostrud exercitation ullamco laboris\nnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor\nin reprehenderit in voluptate velit esse cillum dolore eu fugiat\nnulla pariatur. Excepteur sint occaecat cupidatat non proident,\nsunt in culpa qui officia deserunt mollit anim id est laborum.\n'
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur ',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam, quis nostrud exercitation ullamco laboris\nnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor\nin reprehenderit in voluptate velit esse cillum dolore eu fugiat\nnulla pariatur. Excepteur sint occaecat cupidatat non proident,\nsunt in culpa qui officia deserunt mollit anim id est laborum.\n'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: comColor,
        title: Text("Notification"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Notificaion());
              },
              icon: Icon(Icons.person_outline)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Recent(3)",
              style: TextStyle(color: Colors.grey, fontSize: 17.h),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.h)),
                      child: ExpansionTile(
                        title: Text("${recent[index]['title']}",
                            style: TextStyle(
                                fontSize: 15.h,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        children: [
                          Text(
                            "${recent[index]['info']}",
                            style: TextStyle(
                                fontSize: 11.h, color: Color(0xff3D3D3D)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
