import 'package:coffe_app/Views/widget/custom_heading.dart';
import 'package:coffe_app/Views/widget/profile_textfield.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeading(),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/profile-img.png",
                    width: 68.w,
                    height: 68.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amna Emad",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                      Text("• 65 points",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: greenColor))
                    ],
                  ),
                  SizedBox(
                    width: 151.w,
                  ),
                  Container(
                    width: 31.w,
                    height: 31.h,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Image.asset("assets/images/edit-profile-img.png"),
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 9.w),
                child: Text(
                  "Account Details",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                    width: 351.w,
                    height: 269.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: blackColor.withOpacity(0.2))),
                    child: Column(
                      children: [
                        CustomProfileTextFormField(
                            inputType: TextInputType.name,
                            iconImage: Image.asset(
                              "assets/images/person-img.png",
                              width: 16.w,
                              height: 16.h,
                            ),
                            text: "Pinki Po"),
                        CustomProfileTextFormField(
                            inputType: TextInputType.number,
                            iconImage: Image.asset(
                              "assets/images/call-icon.png",
                              width: 16.w,
                              height: 16.h,
                            ),
                            text: "+44 321 5678"),
                        CustomProfileTextFormField(
                            inputType: TextInputType.emailAddress,
                            iconImage: Image.asset(
                              "assets/images/emails-icon-img.png",
                              width: 16.w,
                              height: 16.h,
                            ),
                            text: "amnemad34@gmail.com")
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
