import 'dart:io';

import 'package:coffe_app/Controllers/user_controller.dart';
import 'package:coffe_app/Views/widget/custom_heading.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

var controller = Get.find<UserController>();

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHeading(),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 52.w,
                            height: 52.h,
                            child: Obx(() {
                              return CircleAvatar(
                                backgroundImage: controller.ImagePath.isNotEmpty
                                    ? FileImage(
                                        File(controller.ImagePath.toString()))
                                    : null,
                                child: controller.ImagePath.isEmpty
                                    ? Image.asset(
                                        "assets/images/profile-img.png") // Fallback icon when no image is provided
                                    : null,
                              );
                            }),
                          ),
                          // Obx(
                          //   () => controller.ImagePath.isNotEmpty
                          //       ? Image.file(
                          //           width: 68.w,
                          //           height: 68.h,
                          //           File(controller.ImagePath.toString()))
                          //       : Image.asset(
                          //           "assets/images/profile-img.png",
                          //           width: 68.w,
                          //           height: 68.h,
                          //         ),
                          // ),
                          SizedBox(
                            width: 8.w,
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
                            width: 222.w,
                          ),
                          InkWell(
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: blackColor.withOpacity(0.2))),
                              child: GestureDetector(
                                onTap: () {
                                  controller.getImage();
                                },
                                child: Image.asset(
                                    "assets/images/edit-profile-img.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          "Account Details",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Center(
                        child: Container(
                          width: 351.w,
                          height: 269.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: blackColor.withOpacity(0.2))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 2.h),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/account-img.png",
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text(
                                      controller.user['name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: const Divider(),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 2.h),
                                child: Row(
                                  children: [
                                    SvgIcon(
                                      "assets/icons/call-icon.svg",
                                      width: 18.w,
                                      height: 17.h,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text(
                                      controller.user['phoneNumber'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: const Divider(),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 2.h),
                                child: Row(
                                  children: [
                                    SvgIcon(
                                      "assets/icons/email-icons.svg",
                                      width: 18.w,
                                      height: 14.h,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Text(
                                      controller.user['email'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: const Divider(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
