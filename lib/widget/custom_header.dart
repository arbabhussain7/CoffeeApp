import 'package:coffe_app/Views/cart/views/cart_screen.dart';
import 'package:coffe_app/Views/notification/views/notification_screen.dart';
import 'package:coffe_app/Views/profile/controllers/profile_controller.dart';

import 'package:coffe_app/Views/profile/views/profile_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends GetView<ProfileController> {
  CustomHeader({
    super.key,
  });
  var imageUrl = "".obs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const ProfileScreen());
            },
            child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:
                    NetworkImage(controller.userController.user["imageUrl"])),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.userController.user['name'],
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
            width: 190.w,
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
              child: SvgPicture.asset(
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
              child: SvgPicture.asset(
                "assets/icons/cart-icon.svg",
                color: brownColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
