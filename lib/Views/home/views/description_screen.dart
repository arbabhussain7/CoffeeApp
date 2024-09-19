import 'package:coffe_app/Views/order/views/order_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/constant/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

int selectedSizeIndex = 1;
int selectedOptions = 1;
int isSelectedOptions = 1;
int isSelected = 0;
int selectedOption = 0;
int isSelectedRadio = 0;

List<Map<String, dynamic>> itemsList = [
  {'name': 'Vanilla Syrup', 'price': 1.5},
  {'name': 'Caramel Syrup', 'price': 1.5},
  {'name': 'Whipped Cream', 'price': 1.5},
  {'name': 'Sprinkles', 'price': 1.5},
];

List<bool> isSelectedButton = [];

@override
void initState() {
  initState();
  isSelectedButton = List.generate(itemsList.length, (index) => false);
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/images/chocalate-img.png"),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, left: 289.w),
                  child: Container(
                    width: 95.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: whiteColor),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Available",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: greenColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 273.h, left: 28.w),
                  child: Container(
                    width: 339.w,
                    height: 86.h,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: blackColor.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 4)
                        ],
                        border: Border.all(color: blackColor.withOpacity(0.2)),
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Text(
                      ("Although a mocha is often interpreted differently across the world, the basis is that a shot of espresso is combined with chocolate powder or syrup, followed by milk or cream."),
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: brownColor),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Iced Spanish Mocca",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor),
                  ),
                  Container(
                    width: 31.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor.withOpacity(0.05)),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: const Icon(
                      Icons.favorite,
                      color: redColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80.w,
                    height: 23.h,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: blackColor.withOpacity(0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 16.sp,
                          color: blackColor,
                        ),
                        Text(
                          "1",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                        ),
                        Icon(
                          Icons.add,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Starts from \$10",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: brownColor),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Choose a variation",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 363.w,
                height: 44.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: blackColor.withOpacity(0.05)),
                child: SizedBox(
                  height: 112.h,
                  // width: 87.2,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                        child: Container(
                          width: 97.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: selectedSizeIndex == index
                                  ? primaryColor
                                  : null),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                listOfItems[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: selectedSizeIndex == index
                                        ? whiteColor
                                        : blackColor.withOpacity(0.5)),
                              ),
                              Image.asset(
                                "assets/images/cup-coffer-img.png",
                                width: 17.w,
                                height: 25.h,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 35.w,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Syrup/Toppings",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
            ),
            SizedBox(
              height: 161.h,
              child: ListView.separated(
                itemCount: listOfTopping.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedOptions = index;
                      });
                      print(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                        color: isSelectedOptions == index
                                            ? primaryColor
                                            : null,
                                        shape: BoxShape.circle)),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                listOfTopping[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: blackColor),
                              ),
                            ],
                          ),
                          Text(
                            "+\$1.5",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: isSelectedOptions == index
                                    ? greenColor
                                    : blackColor),
                          ),
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
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Milk and Shot Variations",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Please select your type",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor.withOpacity(0.53)),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: 35.h,
                // width: 111.w,
                child: ListView.separated(
                  itemCount: listOfText.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Container(
                        width: 121.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: brownAccentColor),
                            color: isSelected == index ? primaryColor : null,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              listOfText[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected == index
                                      ? whiteColor
                                      : blackColor),
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 7.w,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 131.h,
              child: ListView.separated(
                itemCount: listOfitemstext.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                      });
                      print(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                                    color: selectedOption == index
                                        ? primaryColor
                                        : null,
                                    shape: BoxShape.circle)),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            listOfitemstext[index],
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: blackColor),
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
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    final message = SnackBar(
                      backgroundColor: whiteColor,
                      // margin: EdgeInsets.all(12),
                      // backgroundColor: primaryColor.withOpacity(0.85),

                      content: Container(
                        width: 378.w,
                        height: 63.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: primaryColor),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: whiteColor,
                            ),
                            Text(
                              "Added to cart (2) ",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                            )
                          ],
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(message);
                  },
                  child: Container(
                    width: 133.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const OrderScreen());
                  },
                  child: Container(
                    width: 133.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Order now",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 33.h,
            )
          ],
        ),
      ),
    );
  }
}
