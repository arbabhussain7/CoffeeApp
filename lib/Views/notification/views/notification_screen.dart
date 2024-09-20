import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(),
              Text(
                "Notifications",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.w),
                    child: Container(
                      width: 378.w,
                      height: 62.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: blackColor.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/party-logo.png"),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Text(
                              "Your order is ready! Please collect it from the branch ",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "3m ago",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: blackColor.withOpacity(0.53)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 335.w,
                    top: 1.5.h,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: redColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.w),
                child: Container(
                  width: 378.w,
                  height: 62.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/party-logo.png"),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Text(
                          "NY Caffeine is preparing your order",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "3m ago",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor.withOpacity(0.53)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.w),
                child: Container(
                  width: 378.w,
                  height: 62.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/party-logo.png"),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Text(
                          "Your order has been placed",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "3m ago",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor.withOpacity(0.53)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
