import 'package:coffe_app/Views/widget/custom_heading.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
                height: 23.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "Order Details ",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              Container(
                width: 371.w,
                height: 472.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                    border: Border.all(color: blackColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
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
                          "12:03 pm",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor.withOpacity(0.53)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Paid with ",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor.withOpacity(0.53)),
                        ),
                        Image.asset("assets/images/payment-img.png"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "3 Items",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
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
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Salted Caramel Latte ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                            Text(
                              "Whipped cream, 2 espresso shots,\n Sprinkles",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor.withOpacity(0.53)),
                            ),
                            Text(
                              "\$10",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.facebook_outlined,
                              color: Colors.transparent,
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(
                              "Qty: 1",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor.withOpacity(0.53)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.asset(
                            "assets/images/cofe-img.png",
                            height: 94.h,
                            width: 100.w,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Salted Caramel Latte ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                            Text(
                              "Whipped cream, 2 espresso shots,\n Sprinkles",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor.withOpacity(0.53)),
                            ),
                            Text(
                              "\$10",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.facebook_outlined,
                              color: Colors.transparent,
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(
                              "Qty: 2",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor.withOpacity(0.53)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                        Text(
                          "\$20.99",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ordered From ",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                        Text(
                          "NY caffeine branch 3",
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor.withOpacity(0.53)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
