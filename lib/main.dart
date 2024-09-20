import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/splash_screen/views/splash_screen.dart';
import 'package:coffe_app/binding/binding_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Firebase.initializeApp();
  Get.put(UserController());

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
            title: 'First Method',
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
