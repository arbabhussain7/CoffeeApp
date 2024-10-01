import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/model/home_model.dart';
import 'package:coffe_app/model/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CartController cartController = Get.find<CartController>();

  RxInt isSelectedIndexs = 1.obs;
  var products = <ProductModel>[].obs;
  var backupProducts = <ProductModel>[];

  var newCategories = [].obs;
  RxList<Category> categories = <Category>[].obs;
  RxInt productsIndex = 0.obs;
  RxInt selectedSizeIndex = 1.obs;
  RxInt isSelectedOptions = 0.obs;
  RxInt isSelecteds = 0.obs;
  RxInt selectedOptions = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      products.clear();
      backupProducts.clear();
      var docs = await FirebaseFirestore.instance.collection('product').get();
      for (var doc in docs.docs) {
        products.add(ProductModel.fromJson(doc.data()));
        backupProducts.add(ProductModel.fromJson(doc.data()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

// FIlter Apply
  applyFilter(category) {
    products.value = backupProducts;
    products.value =
        products.where((prod) => prod.category == category).toList();
  }

// Fetch catergories through array
  void getCategories() async {
    categories.clear();

    var tCategories = await FirebaseFirestore.instance
        .collection('categories')
        .limit(1)
        .get();

    for (var doc in tCategories.docs) {
      newCategories.value = doc.data()['categories'];
    }
  }

// Add Favorite ..

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
