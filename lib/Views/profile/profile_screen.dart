import 'package:coffe_app/Views/profile/profile_detail.dart';
import 'package:coffe_app/Views/splash_screen/splash_screen.dart';
import 'package:coffe_app/Views/widget/custom_heading.dart';
import 'package:coffe_app/Views/widget/profile_info.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

bool isSelectedoption = false;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(),
              Center(
                child: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              SizedBox(
                height: 44.h,
              ),
              Text(
                "Account",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  width: 359.w,
                  height: 197.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: blackColor.withOpacity(0.05)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const ProfileDetail());
                          },
                          child: ProfileInfo(
                            text: "Account Details ",
                            image: "assets/images/account-img.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: ProfileInfo(
                          text: "Payment Details",
                          image: "assets/images/wallets-img.png",
                          width: 18.w,
                          height: 15.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: ProfileInfo(
                          text: "Branch/Location Details  ",
                          image: "assets/images/location-img.png",
                          width: 14.w,
                          height: 18.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: ProfileInfo(
                          text: "Your Cart",
                          image: "assets/images/cart-img.png",
                          width: 17.w,
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.h),
                child: Text(
                  "Notifications",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              Center(
                child: Container(
                  width: 359.w,
                  height: 52.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ring-img.png"),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Receive Notifications",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                      SizedBox(
                        width: 147.w,
                      ),
                      SizedBox(
                        width: 22.w,
                        height: 11.h,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Switch(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: whiteColor,
                              activeTrackColor: primaryColor,
                              value: isSelectedoption,
                              onChanged: (value) {
                                setState(() {
                                  isSelectedoption = value;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 5.w),
                child: Text(
                  "Other",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: blackColor),
                ),
              ),
              Center(
                child: Container(
                  width: 359.w,
                  height: 106.h,
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      ProfileInfo(
                          text: "Manage Orders",
                          image: "assets/images/manage-order-img.png",
                          width: 14.w,
                          height: 17.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: const Divider(),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => const SplashScreen());
                        },
                        child: ProfileInfo(
                            text: "Sign out",
                            image: "assets/images/signout-icon.png",
                            width: 14.w,
                            height: 17.h),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
