import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CartController cartController = Get.find<CartController>();

  RxInt isSelectedIndexs = 1.obs;
  var products = [].obs;
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

  void getCategories() async {
    categories.clear();

    var tCategories = await FirebaseFirestore.instance
        .collection("categories")
        .limit(1)
        .get();
// map data loop

    Category tCategory = Category.fromJson(tCategories.docs.first.data());

    newCategories = tCategories.docs.first.data()['categories'];

    // print("Length " + tCategories.docs.length.toString());
    // for (var doc in tCategories.docs) {
    //   categories.add(Category.fromJson(doc.data()));
    // }
    // docs.docs.map((doc) {
    //   print("data" + doc.data().toString());
    //   categories.add(Category.fromJson(doc.data()));
    // });
    print("categories: " + categories.toString());
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
