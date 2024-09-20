import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          children: [
            CustomHeader(),
            SizedBox(
              height: 22.h,
            ),
            Container(
              width: 358.w,
              // height: 99.h,
              decoration: BoxDecoration(
                  border: Border.all(color: blackColor.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/coffi-img.png",
                          width: 29.w,
                          height: 29.h,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "65 Points",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: blackColor.withOpacity(0.53),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "You are just there!",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: blackColor.withOpacity(0.53),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 22, left: 6, right: 6),
                          child: Row(
                            children: [
                              Container(
                                width: 219.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5.r)
                                    // border: Border.all(color: primaryColor),,
                                    ),
                              ),
                              Container(
                                width: 68.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: blackColor.withOpacity(0.2)),
                              ),
                              Expanded(
                                  child: Image.asset(
                                "assets/images/start-img.png",
                                width: 21.w,
                                height: 20.h,
                              ))
                            ],
                          ),
                        ),
                        Positioned(
                            left: 192,
                            top: -2,
                            child: Image.asset(
                              "assets/images/cartoon_cup-img.png",
                              width: 47.w,
                              height: 47.h,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 954.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 174.w,
                    height: 155.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                'assets/images/ice-latte-img.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                index % 2 == 0
                                    ? "Earn 100 bonus points"
                                    : "You have 30+ points",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: primaryColor),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                index % 2 == 0
                                    ? "Applies on orders above \$20"
                                    : "From your recent orders",
                                style: GoogleFonts.poppins(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor.withOpacity(0.53)),
                              ),
                            ],
                          ),
                        ),
                        // Button at the bottom
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add action here
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(89.w, 25.h),
                              backgroundColor:
                                  index % 2 == 0 ? primaryColor : primaryColor,
                            ),
                            child: Text(
                              index % 2 == 0 ? "Go" : "Redeem",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
