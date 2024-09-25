import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 31.w,
          padding: const EdgeInsets.all(2),
          height: 31.h,
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: blackColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(5.r)),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back-arrow-icon.svg",
              width: 12.w,
              height: 24.h,
            ),
          ),
        ),
        Image.asset(
          "assets/images/coffee-logo.png",
          width: 53.w,
          height: 53.h,
        )
      ],
    );
  }
}
