import 'package:coffe_app/Views/authentication/controllers/auth_controller.dart';
import 'package:get/get.dart';

class BindingScreen extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
