import 'package:coffe_app/Views/order/controller/order_controller.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetail extends GetView<OrderController> {
  final int orderIndex;
  OrderDetail(this.orderIndex, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: blackColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order ${controller.orders[orderIndex]['orderId']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: blackColor),
                                  ),
                                  Text(
                                    "${controller.orders[orderIndex]['createdAt'].toDate().hour % 12 == 0 ? 12 : controller.orders[orderIndex]['createdAt'].toDate().hour % 12}:${controller.orders[orderIndex]['createdAt'].toDate().minute.toString().padLeft(2, '0')}",
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
                                "${controller.orders.isNotEmpty ? controller.orders[orderIndex]['products'].length : orderIndex} Items",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor),
                              ),
                              SizedBox(
                                height: 232.h,
                                child: ListView.separated(
                                  itemCount: controller
                                      .orders[orderIndex]['products'].length,
                                  // controller
                                  //     .orders[index]['products'].length,
                                  itemBuilder: (context, index) {
                                    var product = controller.orders[orderIndex]
                                        ['products'][index];
                                    return Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            product['coffee_img'],
                                            height: 94.h,
                                            width: 100.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product["name"],
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
                                                  color: blackColor
                                                      .withOpacity(0.53)),
                                            ),
                                            Text(
                                              "\$${product["coffee_price"]}",
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
                                              "Qty: ${index + 1}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackColor
                                                      .withOpacity(0.53)),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 13.h,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                              SizedBox(
                                height: 27.h,
                              ),
                              const Divider(),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: blackColor),
                                  ),
                                  Text(
                                    "\$${controller.totalPrice.value}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
