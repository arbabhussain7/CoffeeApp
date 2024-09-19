import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/cart/views/cart_screen.dart';
import 'package:coffe_app/Views/notification/views/notification_screen.dart';

import 'package:coffe_app/Views/profile/views/profile_screen.dart';
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
  var controller = Get.find<UserController>();
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
                backgroundImage: NetworkImage(controller.user["imageUrl"])),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.user['name'],
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
      ),
    );
  }
}
