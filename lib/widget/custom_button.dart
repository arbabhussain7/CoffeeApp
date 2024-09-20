import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
  });
  final String text;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: Size(243.w, 53.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: whiteColor),
      ),
    );
  }
}
