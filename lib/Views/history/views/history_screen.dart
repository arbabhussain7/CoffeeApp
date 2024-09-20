import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_header.dart';
import 'package:coffe_app/widget/custom_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomHeader(),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "Ongoing Order",
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
                padding: EdgeInsets.only(top: 10.h),
                child: const CustomOrder(
                  itemNo: "5 Items",
                ),
              ),
              Positioned(
                left: 285.w,
                top: 5.h,
                child: Container(
                  width: 46.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "23 min",
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: Text(
              "Order History",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
            ),
          ),
          Text(
            "23/09/24",
            style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: blackColor),
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomOrder(
            itemNo: "3 Items",
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomOrder(itemNo: "3 Items"),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "30/09/24",
            style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: blackColor),
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomOrder(
            itemNo: "3 Items",
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomOrder(itemNo: "3 Items")
        ]),
      ),
    ));
  }
}
