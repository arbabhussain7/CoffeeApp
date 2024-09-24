import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/home/views/home_screen.dart';
import 'package:coffe_app/Views/navigation/bottom_nav_bar.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  var user = {}.obs;

  createUser(uid) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      'name': usernameController.text,
      'email': emailController.text,
      'phoneNumber': phoneController.text,
      'imageUrl': "",
      'uid': uid,
    });
  }

  void register() async {
    try {
      isLoading(true);
      var credentials = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await createUser(credentials.user!.uid);

      Get.offAll(() => const HomeScreen());
    } catch (e) {
      Get.snackbar("About User ", "User Message ",
          backgroundColor: primaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account Create Failed",
            style: GoogleFonts.poppins(fontSize: 14.sp, color: whiteColor),
          ),
          messageText: Text(
            e.toString(),
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: whiteColor),
          ));
    } finally {
      isLoading(false);
    }
  }

  void login() async {
    try {
      isLoading(true);
      await auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      userController.getUser();
      Get.offAll(() => const BottomNavBar());
    } catch (e) {
      Get.snackbar("Login ", "User ",
          backgroundColor: primaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login Failed",
            style: GoogleFonts.poppins(fontSize: 14.sp, color: whiteColor),
          ),
          messageText: Text(
            e.toString(),
            style: GoogleFonts.poppins(fontSize: 14.sp, color: whiteColor),
          ));
    } finally {
      isLoading(false);
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
