import 'dart:io';

import 'package:coffe_app/Views/profile/controllers/profile_controller.dart';

import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_button.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:coffe_app/widget/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetail extends GetView<ProfileController> {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                            GestureDetector(
                              onTap: () {
                                controller.getImage();
                              },
                              child: Container(
                                width: 52.w,
                                height: 52.h,
                                child: Obx(() {
                                  return CircleAvatar(
                                    backgroundImage: controller
                                            .ImagePath.isNotEmpty
                                        ? FileImage(File(
                                            controller.ImagePath.toString()))
                                        : null,
                                    child: controller.ImagePath.isEmpty
                                        ? Image.asset(
                                            "assets/images/profile-img.png")
                                        : null,
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
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
                                  onTap: () {},
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
                                  CustomProfileTextFormField(
                                      controller: controller
                                          .userController.nameController,
                                      inputType: TextInputType.name,
                                      iconImage: Image.asset(
                                        "assets/images/person-img.png",
                                        width: 16.w,
                                        height: 16.h,
                                      ),
                                      text: controller
                                          .userController.user['name']),
                                  CustomProfileTextFormField(
                                      controller: controller
                                          .userController.phoneController,
                                      inputType: TextInputType.number,
                                      iconImage: Image.asset(
                                        "assets/images/call-icon.png",
                                        width: 16.w,
                                        height: 16.h,
                                      ),
                                      text: controller
                                          .userController.user['phoneNumber']),
                                  CustomProfileTextFormField(
                                      controller: controller
                                          .userController.emailController,
                                      inputType: TextInputType.emailAddress,
                                      iconImage: Image.asset(
                                        "assets/images/emails-icon-img.png",
                                        width: 16.w,
                                        height: 16.h,
                                      ),
                                      text: controller
                                          .userController.user['email'])
                                ],
                              )),
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 74.h),
                                  child: Center(
                                    child: CustomButton(
                                        text: "Update",
                                        onpressed: () {
                                          controller.updateUser();
                                        }),
                                  ),
                                ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
