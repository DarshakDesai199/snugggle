import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snugggle/View/Login_Screen.dart';
import 'package:snugggle/widget/button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController(initialPage: 0);
  var pageSelected = 0;
  bool pageChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageSelected = value;
                    pageChanged = value == 1;
                  });
                },
                controller: pageController,
                physics: const PageScrollPhysics(),
                children: [Onboarding1(), Onboarding2()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    2,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                pageSelected = index;
                              });
                            },
                            child: pageSelected == index
                                ? Container(
                                    height: 6.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF3F00),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                : Container(
                                    height: 6.h,
                                    width: 6.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                          ),
                        ))
              ],
            ),
            SizedBox(
              height: 67.h,
            ),
            GestureDetector(
              onTap: () {
                pageChanged
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login_Screen(),
                        ),
                      )
                    : pageController.jumpToPage(1);
              },
              child: Button(name: "Next"),
            ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 137.h,
        ),
        Center(
          child: Container(
            height: 191.h,
            width: 275.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/onboarding1.png"),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 45.h,
        ),
        Text(
          'Demo Content\n for placement',
          style: GoogleFonts.rowdies(
            textStyle: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          'Demo Content dolor sit amet,\n consectetur adipiscing elit. Pharetra ut\n auctor lacinia non proin. Facilisis.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 98.h,
        ),
        Center(
          child: Container(
            height: 240.h,
            width: 275.w,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/onboarding2.png"),
            )),
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Text(
          'Demo Content\n for placement',
          style: GoogleFonts.rowdies(
            textStyle: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          'Demo Content dolor sit amet,\n consectetur adipiscing elit. Pharetra ut\n auctor lacinia non proin. Facilisis.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
