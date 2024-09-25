import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomHeading(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              "Your Cart",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
            ),
          ),
          SizedBox(
            height: 342.h,
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 353.w,
                  height: 103.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blackColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.asset(
                            "assets/images/icrem-coffe-img.png",
                            height: 94.h,
                            width: 100.w,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Salted Caramel Latte ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                            Text(
                              "Cold brew and slightly, \nsweetened ",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor.withOpacity(0.53)),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              width: 59.w,
                              height: 23.h,
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: blackColor.withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 10.sp,
                                    color: blackColor,
                                  ),
                                  Text(
                                    "1",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: blackColor),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 10.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 82.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.transparent,
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
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: blackColor.withOpacity(0.2),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Subtotal: \$32.99",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
              SizedBox(
                height: 12.h,
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
                                  borderRadius: BorderRadius.circular(20.sp)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 70.w),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Your order is being prepared. Are you sure you want to cancel? ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: whiteColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 89.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: primaryColor
                                                    .withOpacity(0.82))),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor),
                                          child: Text(
                                            "No",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: whiteColor),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Container(
                                        width: 89.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: primaryColor
                                                    .withOpacity(0.82))),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: redColor),
                                          child: Text(
                                            "Yes",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: whiteColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Checkout",
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: greenColor),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SvgPicture.asset(
                      "assets/icons/forwards-icon.svg",
                      width: 4,
                      height: 7,
                      color: greenColor,
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
