import 'package:coffe_app/Views/Home/home_screen.dart';
import 'package:coffe_app/Views/favorite_screen.dart';
import 'package:coffe_app/Views/history_screen.dart';
import 'package:coffe_app/Views/reward_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_icon/svg_icon.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var index = 0;
  List<Widget> WidgetList = const [
    HomeScreen(),
    FavoriteScreen(),
    HistoryScreen(),
    RewardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: WidgetList[index],
      bottomNavigationBar: Container(
        height: 62.h,
        width: 354.w,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home-nav.svg",
                      width: 20.w,
                      height: 20.h,
                      color: primaryColor,
                      // color: index == 0 ? primaryColor : primaryColor,
                    ),
                    index == 0
                        ? Container(
                            margin: EdgeInsets.only(top: 2.h),
                            height: 2.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(7.r)),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        "assets/icons/favorite-nav.svg",
                        width: 20.w,
                        height: 18.h,
                        color: primaryColor,
                      ),
                      index == 1
                          ? Container(
                              margin: EdgeInsets.only(top: 2.h),
                              height: 2.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(7.r)),
                            )
                          : const SizedBox()
                    ],
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        "assets/icons/history-nav.svg",
                        width: 20.w,
                        height: 20.h,
                        color: index == 2 ? primaryColor : primaryColor,
                      ),
                      index == 2
                          ? Container(
                              margin: EdgeInsets.only(top: 2.h),
                              height: 2.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(7.r)),
                            )
                          : const SizedBox()
                    ],
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        "assets/icons/reward-nav.svg",
                        width: 24.w,
                        height: 24.h,
                        color: index == 3 ? primaryColor : primaryColor,
                      ),
                      index == 3
                          ? Container(
                              margin: EdgeInsets.only(top: 2.h),
                              height: 2.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  color: brownColor,
                                  borderRadius: BorderRadius.circular(7.r)),
                            )
                          : const SizedBox()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
