import 'package:coffe_app/Views/order/controller/order_controller.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends GetView<OrderController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        CustomHeader(),
                        SizedBox(
                          height: 72.h,
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
                                padding: EdgeInsets.only(top: 8.h),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.calculateTotalPrice(0);
                                  },
                                  child: Container(
                                    width: 373.w,
                                    height: 122.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: blackColor.withOpacity(0.2)),
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 5.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Order ${controller.orders[0]['orderId']}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackColor),
                                            ),
                                            Text(
                                              "${controller.orders[0]['createdAt'].toDate().hour % 12 == 0 ? 12 : controller.orders[0]['createdAt'].toDate().hour % 12}:${controller.orders[0]['createdAt'].toDate().minute.toString().padLeft(2, '0')}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackColor
                                                      .withOpacity(0.53)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${controller.orders.isNotEmpty ? controller.orders[0]['products'].length : 0} Items",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackColor),
                                            ),
                                            Text(
                                              "\$${controller.totalPrice.value}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: brownColor),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: const Divider(),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${controller.orders[0]['products'].map((product) => product['name']).join(', ')}",
                                              style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackColor
                                                    .withOpacity(0.53),
                                              ),
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                      ],
                                    ),
                                  ),
                                )),
                            Positioned(
                              left: 310.w,
                              // top: 2.h,
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
                        SizedBox(
                          height: 423.h,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.orders.length,
                            itemBuilder: (context, index) {
                              return index == 0
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        controller.calculateTotalPrice(index);
                                      },
                                      child: Container(
                                        width: 353.w,
                                        height: 122.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: blackColor
                                                    .withOpacity(0.2)),
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 5.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Order ${controller.orders[index]['orderId']}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor),
                                                ),
                                                Text(
                                                  "${controller.orders[index]['createdAt'].toDate().hour % 12 == 0 ? 12 : controller.orders[index]['createdAt'].toDate().hour % 12}:${controller.orders[index]['createdAt'].toDate().minute.toString().padLeft(2, '0')}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor
                                                          .withOpacity(0.53)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${controller.orders.isNotEmpty ? controller.orders[index]['products'].length : index} Items",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor),
                                                ),
                                                Text(
                                                  "\$${controller.totalPrice.value}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: brownColor),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w),
                                              child: const Divider(),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${controller.orders[index]['products'].map((product) => product['name']).join(', ')}",
                                                  // "",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor
                                                          .withOpacity(0.53)),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "See Details",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor),
                                                ),
                                                Image.asset(
                                                  "assets/images/forwards-img.png",
                                                  width: 15.w,
                                                  height: 10.h,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 14.h,
                              );
                            },
                          ),
                        ),
                      ]),
          ),
        ),
      ),
    );
  }
}
