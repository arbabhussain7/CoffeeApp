import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.text,
    required this.icons,
    required this.hintText,
    required this.obscureText,
    required this.inputType,
    this.validator,
    required this.controller,
  });

  final String text;
  final SvgPicture icons;
  final String hintText;
  final TextInputType inputType;
  bool obscureText = false;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      // height: 85.h,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 6.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: blackColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(22.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Row(
              children: [
                icons,
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      color: brownColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.w),
            height: 20.h,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.5, color: blackColor.withOpacity(0.2)))),
            child: TextFormField(
              controller: controller,
              validator: validator,
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
              obscureText: obscureText,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
