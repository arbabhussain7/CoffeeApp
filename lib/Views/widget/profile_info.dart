import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfileInfo extends StatelessWidget {
  ProfileInfo(
      {super.key,
      required this.text,
      required this.image,
      required this.width,
      required this.height});

  final String text;
  String image;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Image.asset(
                image,
                width: width,
                height: height,
                color: blackColor.withOpacity(0.53),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 12.w),
        //   child: Divider(),
        // )
      ],
    );
  }
}
