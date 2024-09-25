import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/payment/views/payment.dart';
import 'package:coffe_app/Views/payment/views/payment_detail.dart';

import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_button.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends GetView<CartController> {
  @override
  OrderScreen({super.key});
  @override
  var controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    controller.getCartData();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeading(),
                Text(
                  "Confirm Your Order",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order from",
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
                    )
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pickup from",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor),
                    ),
                    Text(
                      "31st Maple Street, NYC 3",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor.withOpacity(0.53)),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Divider(
                  color: blackColor.withOpacity(0.2),
                ),
                RichText(
                    text: TextSpan(
                        text: "Details",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                        children: [
                      TextSpan(
                          text: "(3 Items)",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: blackColor.withOpacity(0.53)))
                    ])),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 212.h,
                  child: Obx(
                    () => ListView.separated(
                      itemCount: controller.carts.length,
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
                                    child: Image.network(
                                      controller.carts[index]["coffee_img"],
                                      height: 94.h,
                                      width: 100.w,
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.carts[index]["name"],
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
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
                                SizedBox(
                                  width: 17.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "\$${controller.carts[index]["coffee_price"]}"
                                            .toString(),
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
                        return SizedBox(height: 11.h);
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor),
                    ),
                    Obx(
                      () => Text(
                        "\$${controller.totalPrice.value}",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: brownColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Small order fee",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor.withOpacity(0.53)),
                    ),
                    Text(
                      "\$5",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor.withOpacity(0.53)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST(where applicable)",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor.withOpacity(0.53)),
                    ),
                    Text(
                      "\$5",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: blackColor.withOpacity(0.53)),
                    ),
                  ],
                ),
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
                      "\$${controller.subTotalPrice.value}",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: brownColor),
                    ),
                  ],
                ),
                Divider(
                  color: blackColor.withOpacity(0.05),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    width: 353.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: blackColor.withOpacity(0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select a payment method",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: brownColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(const PaymentScreen());
                            // Get.to(PaymentScreen());
                          },
                          child: SvgPicture.asset(
                            "assets/icons/forward-icon.svg",
                            width: 16.w,
                            height: 16.h,
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                  child: Row(
                    children: [
                      Text(
                        "Paid with ",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.53)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PaymentDetail());
                        },
                        child: Container(
                          width: 55.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: blackColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Image.asset("assets/images/payment-img.png"),
                        ),
                      ),
                      SizedBox(
                        width: 197.w,
                      ),
                      Text(
                        "\$22.5",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor.withOpacity(0.53)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 63.h,
                ),
                Center(
                    child: CustomButton(
                        text: "Done",
                        onpressed: () {
                          controllor.makePayment(
                              "${controller.subTotalPrice}", "PKR");
                          // final message = SnackBar(
                          //   backgroundColor: whiteColor,
                          //   content: Container(
                          //     width: 378.w,
                          //     height: 63.h,
                          //     padding: EdgeInsets.symmetric(horizontal: 12.w),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15.r),
                          //         color: primaryColor),
                          //     child: Row(
                          //       children: [
                          //         SvgIcon(
                          //           "assets/icons/check-icon.svg",
                          //           color: whiteColor,
                          //           width: 20.w,
                          //           height: 20.h,
                          //         ),
                          //         SizedBox(
                          //           width: 6.w,
                          //         ),
                          //         Text(
                          //           "Order Placed Successfully! ",
                          //           style: GoogleFonts.poppins(
                          //               fontSize: 16.sp,
                          //               fontWeight: FontWeight.w400,
                          //               color: whiteColor),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(message);
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
