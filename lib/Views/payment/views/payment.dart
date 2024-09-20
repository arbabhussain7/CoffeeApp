import 'package:coffe_app/Views/payment/controllers/payment_controller.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/constant/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends GetView<PaymentController> {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SizedBox(
            width: 429.w,
            height: 439.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "Payment Pending",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "Please choose a payment method",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor.withOpacity(0.53)),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 331.h,
                  child: ListView.separated(
                    itemCount: listOfpayment.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () => controller.selectedOption(index),
                          child: Row(
                            children: [
                              Container(
                                width: 23.w,
                                height: 23.h,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: blackColor.withOpacity(0.05),
                                    shape: BoxShape.circle),
                                child: Container(
                                    width: 11.w,
                                    height: 11.h,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.selectedOptions.value ==
                                                    index
                                                ? primaryColor
                                                : null,
                                        shape: BoxShape.circle)),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                child: Container(
                                  width: 350.w,
                                  height: 64.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 22.w),
                                  decoration: BoxDecoration(
                                      color: blackColor.withOpacity(0.05),
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Row(
                                    children: [
                                      Image.asset(listOfpayment[index]),
                                      SizedBox(
                                        width: 18.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            listOfPaymentTexts[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackColor),
                                          ),
                                          Text(
                                            "**** **** **** 3455",
                                            style: GoogleFonts.poppins(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackColor
                                                    .withOpacity(0.53)),
                                          ),
                                          Text(
                                            "Active",
                                            style: GoogleFonts.poppins(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: greenColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
