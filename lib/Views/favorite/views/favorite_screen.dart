import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(),
            SizedBox(height: 42.w),
            Text(
              "Your Favourites",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
            ),
            SizedBox(
              height: 32.h,
            ),
            Container(
                width: 370.w,
                height: 555.h,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
                decoration: BoxDecoration(
                    border: Border.all(color: blackColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(15.r)),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Container(
                            width: 353.w,
                            height: 103.h,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: blackColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image.asset(
                                    "assets/images/icrem-coffe-img.png",
                                    width: 100.w,
                                    height: 94.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Salted Caramel Latte",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: blackColor),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Whipped cream, 2 espresso shots, Sprinkles ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                blackColor.withOpacity(0.53)),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "\$10",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: brownColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 312,
                            top: 5,
                            child: Image.asset(
                              "assets/images/favorite-icon.png",
                              width: 15.w,
                              height: 13.h,
                            )),
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
