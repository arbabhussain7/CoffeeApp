import 'package:coffe_app/Views/order_detail.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOrder extends StatelessWidget {
  const CustomOrder({
    super.key,
    required this.itemNo,
  });

  final String itemNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 122.h,
      decoration: BoxDecoration(
          border: Border.all(color: blackColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(15.r)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order #123456",
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
              Text(
                "12:30 pm",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor.withOpacity(0.53)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemNo,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
              Text(
                "\$20.99",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: brownColor),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: const Divider(),
          ),
          Row(
            children: [
              Text(
                "Iced Latte, Spanish Mocca, Salted Caramel \n+2 more items ",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor.withOpacity(0.53)),
              ),
              const Icon(
                Icons.add_ic_call_outlined,
                color: Colors.transparent,
              )
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const OrderDetail());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "See Details",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
                Image.asset(
                  "assets/images/forwards-img.png",
                  width: 15.w,
                  height: 10.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
