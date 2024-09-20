import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/home/controllers/product_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductController productController = Get.find<ProductController>();
  RxInt isSelectedIndexs = 1.obs;
  var products = [].obs;
  RxInt productsIndex = 0.obs;
  RxInt selectedSizeIndex = 1.obs;
  RxInt isSelectedOptions = 0.obs;
  RxInt isSelecteds = 0.obs;
  RxInt selectedOptions = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      products.clear();
      var docs = await FirebaseFirestore.instance.collection('product').get();
      for (var doc in docs.docs) {
        products.add(doc);
      }
    } catch (e) {
      print(e.toString());
    } finally {}
  }

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
