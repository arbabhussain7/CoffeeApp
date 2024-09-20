import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxInt selectedOptions = 1.obs;

  void selectedOption(int index) {
    selectedOptions.value = index;
  }
}
