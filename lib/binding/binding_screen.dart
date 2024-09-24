import 'package:coffe_app/Views/authentication/controllers/auth_controller.dart';
import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/home/controllers/home_controller.dart';
import 'package:coffe_app/Views/home/controllers/product_controller.dart';
import 'package:coffe_app/Views/navigation/controller/navigation_controllor.dart';
import 'package:coffe_app/Views/payment/controllers/payment_controller.dart';
import 'package:coffe_app/Views/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class BindingScreen extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => NavigationControllor(), fenix: true);
    Get.lazyPut(() => PaymentsController(), fenix: true);
    Get.lazyPut(() => ProductController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
