import 'package:coffe_app/Views/authentication/controllers/auth_controller.dart';

import 'package:coffe_app/constant/color.dart';
import 'package:coffe_app/widget/custom_button.dart';
import 'package:coffe_app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:svg_icon/svg_icon.dart';

class SignUpScreen extends GetView<AuthController> {
  SignUpScreen({super.key});
  bool isPhoneValidated = false;
  final GlobalKey<FormState> key1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key1,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 64.h),
                child: Center(
                  child: Image.asset(
                    "assets/images/coffee-logo.png",
                    width: 55.w,
                    height: 55.h,
                  ),
                ),
              ),
              Text(
                "Let’s Sign You Up",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: brownColor),
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomTextfield(
                controller: controller.usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
                text: "Username",
                icons: const SvgIcon(
                  "assets/icons/account-icon.svg",
                  width: 16,
                  height: 16,
                  color: brownColor,
                ),
                obscureText: false,
                inputType: TextInputType.text,
                hintText: "pinki_poo",
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomTextfield(
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email address";
                  } else if (!GetUtils.isEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                text: "Email",
                icons: const SvgIcon(
                  "assets/icons/email-icon.svg",
                  width: 16,
                  height: 16,
                  color: brownColor,
                ),
                obscureText: false,
                inputType: TextInputType.emailAddress,
                hintText: "pinkipo@gmail.com",
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                width: 336.w,
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
                          const SvgIcon(
                            "assets/icons/password-icon.svg",
                            width: 16,
                            height: 16,
                            color: brownColor,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Phone Number",
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
                                  width: 1.5,
                                  color: blackColor.withOpacity(0.2)))),
                      child: IntlPhoneField(
                        controller: controller.phoneController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 12.h),
                            border: InputBorder.none,
                            hintText: "343424449"),
                        showCountryFlag: false,
                        initialCountryCode: 'PAK',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        dropdownIconPosition: IconPosition.trailing,
                        dropdownTextStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: blackColor,
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        flagsButtonPadding: const EdgeInsets.only(left: 10),
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomTextfield(
                controller: controller.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  }
                  return null;
                },
                obscureText: true,
                inputType: TextInputType.visiblePassword,
                text: "Password",
                icons: const SvgIcon(
                  "assets/icons/password-icon.svg",
                  width: 16,
                  height: 16,
                  color: brownColor,
                ),
                hintText: "**********",
              ),
              SizedBox(
                height: 42.h,
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        text: "Sign up",
                        onpressed: () {
                          if (key1!.currentState!.validate()) {
                            controller.register();

                            print('Validation Successful');
                          }
                        },
                      ),
              ),
              SizedBox(
                height: 22.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                        children: [
                      TextSpan(
                        text: " Sign In",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: brownColor),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
