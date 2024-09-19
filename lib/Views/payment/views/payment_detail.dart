import 'package:coffe_app/Views/order/views/manage_order.dart';
import 'package:coffe_app/Views/widget/custom_heading.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/constant/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({super.key});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            children: [
              const CustomHeading(),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cards and Payment",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor),
                  ),
                  Container(
                    width: 31.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: blackColor.withOpacity(0.2)),
                    ),
                    child: Icon(
                      Icons.add,
                      color: blackColor.withOpacity(0.53),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Container(
                width: 375.w,
                height: 287.h,
                decoration: BoxDecoration(
                    border: Border.all(color: blackColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(15.r)),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ManageOrder());
                            },
                            child: Container(
                              width: 31.w,
                              padding: const EdgeInsets.all(5),
                              height: 31.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: blackColor.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(5.r)),
                              child:
                                  const SvgIcon("assets/icons/edit-icon.svg"),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            width: 31.w,
                            padding: const EdgeInsets.all(5),
                            height: 31.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: blackColor.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: const SvgIcon(
                              "assets/icons/delete-icon.svg",
                              color: redColor,
                            ),
                          )
                        ]),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Center(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  width: 350.w,
                                  height: 64.h,
                                  decoration: BoxDecoration(
                                      color: blackColor.withOpacity(0.05),
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Row(
                                    children: [
                                      Image.asset(listOfpaymenticons[index]),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listOfPaymentsTexts[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackColor),
                                          ),
                                          Text(
                                            "**** **** **** 3455",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackColor),
                                          ),
                                          Text(
                                            "Active",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: greenColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    // separatorBuilder: (context, index) {
                    //   return SizedBox(
                    //     height: 12.h,
                    //   );
                    // },
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
