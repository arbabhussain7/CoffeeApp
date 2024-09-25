import 'package:coffe_app/Views/navigation/controller/navigation_controllor.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<NavigationControllor> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: controller.widgetList[controller.selectedIndex.value],
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
                  onTap: () => controller.isSelectedIndex(0),
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
                      controller.selectedIndex == 0
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
                    onTap: () => controller.isSelectedIndex(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/favorite-nav.svg",
                          width: 20.w,
                          height: 18.h,
                          color: primaryColor,
                        ),
                        controller.selectedIndex == 1
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
                    onTap: () => controller.isSelectedIndex(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/history-nav.svg",
                          width: 20.w,
                          height: 20.h,
                          color: controller.selectedIndex == 2
                              ? primaryColor
                              : primaryColor,
                        ),
                        controller.selectedIndex == 2
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
                    onTap: () => controller.isSelectedIndex(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/reward-nav.svg",
                          width: 24.w,
                          height: 24.h,
                          color: controller.selectedIndex == 3
                              ? primaryColor
                              : primaryColor,
                        ),
                        controller.selectedIndex == 3
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
      ),
    );
  }
}
