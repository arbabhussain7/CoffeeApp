import 'package:coffe_app/Views/home/controllers/home_controller.dart';
import 'package:coffe_app/Views/home/views/description_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/constant/list.dart';
import 'package:coffe_app/widget/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.h,
              ),
              CustomHeader(),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor.withOpacity(0.5)),
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor.withOpacity(0.5)),
                    prefixIcon: Image.asset(
                      "assets/images/search-img.png",
                      width: 22.w,
                      height: 22.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          BorderSide(color: blackColor.withOpacity(0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          BorderSide(color: blackColor.withOpacity(0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          BorderSide(color: blackColor.withOpacity(0.2)),
                    )),
              ),
              SizedBox(
                height: 27.h,
              ),
              Container(
                width: 371.w,
                height: 199.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: primaryColor),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 22.w,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You are almost there!",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                            ),
                            Text(
                              "40 stars till next reward",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: whiteColor),
                            ),
                            Text(
                              "Redeem your points after every purchase and get free coffee every 100 points",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: -0.3,
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/coffee-cup-img.png",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  width: 349.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: blackColor.withOpacity(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View Daily Missions",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: brownColor),
                      ),
                      SvgIcon(
                        "assets/icons/forward-icon.svg",
                        width: 16.w,
                        height: 16.h,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.w),
                child: Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              SizedBox(
                height: 33.h,
                child: ListView.separated(
                  itemCount: listOfCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // controller.isSelectedIndexs == index;
                    return Obx(
                      () => GestureDetector(
                        onTap: () => controller.isSelectedIndex(index),
                        child: Container(
                          width: 78.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: controller.isSelectedIndexs == index
                                  ? primaryColor
                                  : whiteColor,
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              listOfCategories[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: controller.isSelectedIndexs == index
                                      ? whiteColor
                                      : blackColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 12.w,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.w),
                child: Text(
                  "Popular Here",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              SizedBox(
                height: 360.h,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, snapshot) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DescriptionScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 171.w,
                            height: 188.h,
                            padding: EdgeInsets.only(top: 84.h),
                            decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15.r),
                                image: const DecorationImage(
                                    image: AssetImage(
                                  "assets/images/coffee-glass-img.png",
                                ))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 155.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: whiteColor.withOpacity(0.25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Iced Spanish Mocca",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: whiteColor),
                                      ),
                                      Text(
                                        "Starts from \$10",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: whiteColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.arrow_back,
                                            color: Colors.transparent,
                                          ),
                                          SvgIcon(
                                            "assets/icons/forward-icon.svg",
                                            width: 16.w,
                                            height: 16.h,
                                            color: blackColor.withOpacity(0.53),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Text(
                  "You Might Also Like",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              SizedBox(
                height: 332.h,
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 347.w,
                      height: 87.h,
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
                                height: 81.h,
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
                                  "Cold brew and slightly sweetened ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: blackColor.withOpacity(0.53)),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "Starts from",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: brownColor),
                                        children: [
                                      TextSpan(
                                          text: "\$12",
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: brownColor))
                                    ]))
                              ],
                            ),
                            SizedBox(
                              width: 52.w,
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
                                  SvgIcon(
                                    "assets/icons/forward-icon.svg",
                                    width: 16.w,
                                    height: 16.h,
                                    color: blackColor.withOpacity(0.2),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
