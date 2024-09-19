import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileTextFormField extends StatelessWidget {
  CustomProfileTextFormField({
    super.key,
    required this.iconImage,
    required this.text,
    required this.inputType,
    this.readonly = false,
    required this.controller,
  });
  String text;
  final Image iconImage;
  final TextInputType inputType;
  final TextEditingController controller;
  bool readonly;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          readOnly: readonly,
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 12.sp, fontWeight: FontWeight.w400, color: blackColor),
          decoration: InputDecoration(
              hintText: text,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor),
              contentPadding: EdgeInsets.only(top: 29.h),
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 23.h),
                child: iconImage,
              ),
              border: InputBorder.none),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Divider(
            color: blackColor.withOpacity(0.2),
          ),
        )
      ],
    );
  }
}
