import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt isSelectedIndexs = 1.obs;

  RxInt selectedSizeIndex = 1.obs;
  RxInt isSelectedOptions = 0.obs;
  RxInt isSelecteds = 0.obs;
  RxInt selectedOptions = 0.obs;

  ///home
  void isSelectedIndex(int index) {
    isSelectedIndexs.value = index;
  }

//description screen
  void selectedIndex(int index) {
    selectedSizeIndex.value = index;
  }

  void isSelectedOption(int index) {
    isSelectedOptions.value = index;
  }

  void isSelected(int index) {
    isSelecteds.value = index;
  }

  void selectedOption(int index) {
    selectedOptions.value = index;
  }
}
