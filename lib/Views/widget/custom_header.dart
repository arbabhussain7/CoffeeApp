import 'package:coffe_app/Views/cart_screen.dart';
import 'package:coffe_app/Views/notification_screen.dart';
import 'package:coffe_app/Views/profile/profile_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class CustomHeader extends StatefulWidget {
  CustomHeader({
    super.key,
  });

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const ProfileScreen());
          },
          child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png")),
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pinki Pou",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: brownColor),
            ),
            Text("• 65 points",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: greenColor)),
          ],
        ),
        SizedBox(
          width: 170.w,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const NotificationScreen());
          },
          child: Container(
            width: 31.w,
            height: 31.h,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: blackColor.withOpacity(0.2),
                )),
            child: const SvgIcon(
              "assets/icons/ring-icon.svg",
              color: brownColor,
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const CartScreen());
          },
          child: Container(
            width: 31.w,
            height: 31.h,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: blackColor.withOpacity(0.2),
                )),
            child: const SvgIcon(
              "assets/icons/cart-icon.svg",
              color: brownColor,
            ),
          ),
        ),
      ],
    );
  }
}
