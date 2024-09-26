import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  RxBool isLoading = false.obs;
  var product = {}.obs;
  var productId = Get.arguments[0];
  RxInt selectedSizeIndex = 1.obs;
  RxInt isSelectedOptions = 0.obs;
  RxInt isSelecteds = 0.obs;
  RxInt selectedOptions = 0.obs;

  CartController controller = Get.find<CartController>();
  @override
  onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      print("Prodect Id" + productId);

      var prod = await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .get();
      print(prod.data());
      product(prod.data());
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

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
