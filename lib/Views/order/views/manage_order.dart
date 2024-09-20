import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class ManageOrder extends StatelessWidget {
  const ManageOrder({super.key});

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
              SizedBox(
                height: 33.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "Ongoing Orders",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              Container(
                width: 360.w,
                height: 131.h,
                decoration: BoxDecoration(
                    border: Border.all(color: blackColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 3.h),
                        child: Row(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 3.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5 Items ",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                            Text(
                              "\$20.99 ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: brownColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.w),
                        child: const Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Iced Latte, Spanish Mocca, Salted Caramel +2 more items ",
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor.withOpacity(0.53)),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.transparent,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: Center(
                                              child: Container(
                                                width: 371.w,
                                                height: 199.h,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.sp)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgIcon(
                                                      "assets/icons/alert-icon.svg",
                                                      width: 38.w,
                                                      height: 38.h,
                                                      color: whiteColor,
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 87.w),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Can only cancel the order within 15 minutes of placing it ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    whiteColor),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    "Cancel Order",
                                    style: GoogleFonts.poppins(
                                        decoration: TextDecoration.underline,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: redColor),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
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
