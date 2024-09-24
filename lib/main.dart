import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/home/controllers/product_controller.dart';
import 'package:coffe_app/Views/profile/controllers/profile_controller.dart';
import 'package:coffe_app/Views/splash_screen/views/splash_screen.dart';
import 'package:coffe_app/binding/binding_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(UserController());
  Get.put(CartController());
  Get.put(ProductController());
  Get.put(ProfileController());

  Stripe.publishableKey =
      "pk_test_51Q1nGrFHugyQIn2Jo2F4AJUICJQAYwhiZtrZZSab0MBvLUAIChcaTt8bvfQZTL0sqBpoUnq6evjsTeslbzWpwmBb00lQXUvOxN";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: BindingScreen(),
            title: 'Coffee App',
            theme: ThemeData(
              scaffoldBackgroundColor: whiteColor,
              primaryColor: brownColor,
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: brownColor,
                  selectionColor: brownColor.withOpacity(0.5),
                  selectionHandleColor: brownColor),
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const SplashScreen());
  }
}
