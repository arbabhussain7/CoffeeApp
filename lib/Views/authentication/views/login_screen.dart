import 'package:coffe_app/Views/authentication/controllers/auth_controller.dart';
import 'package:coffe_app/Views/authentication/views/signup_screen.dart';
import 'package:coffe_app/Views/widget/custom_button.dart';
import 'package:coffe_app/Views/widget/custom_textfield.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GlobalKey<FormState> key = GlobalKey();
var controller = Get.put(AuthController());

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: key,
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
                  "Let’s Sign You In",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: brownColor),
                ),
                SizedBox(
                  height: 22.h,
                ),
                CustomTextfield(
                  controller: controller.loginEmailController,
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
                CustomTextfield(
                  controller: controller.loginPasswordController,
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
                // CustomTextfield()
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackColor.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 42.h,
                ),
                CustomButton(
                  text: "Sign in",
                  onpressed: () {
                    if (key.currentState!.validate()) {
                      controller.login();
                      print("Valid iput ");
                    }
                  },
                ),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Don’t have an account?",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor),
                          children: [
                        TextSpan(
                          text: "Sign Up",
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
      ),
    );
  }
}
