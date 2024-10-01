import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<ProductModel> product = Rxn<ProductModel>();
  // RxString productId = ''.obs;

  var productId = Get.arguments[0];
  RxInt selectedSizeIndex = 1.obs;
  RxInt isSelectedOptions = 0.obs;
  RxInt isSelecteds = 0.obs;
  RxInt selectedOptions = 0.obs;
  var isFav = false.obs;

  CartController controller = Get.find<CartController>();
  @override
  onInit() {
    super.onInit();

    getProduct();
  }

  void getProduct() async {
    try {
      isLoading(true);
      print("Prodect Id" + productId);

      var prod = await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .get();
      // print(prod.data().toString());
      product.value = ProductModel.fromJson(prod.data()!);

      isFav.value = product.value!.favorite!
          .contains(FirebaseAuth.instance.currentUser!.uid);
      product(ProductModel.fromJson(prod.data()!));

      print("product.." + product.toString());
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void toggleFavorite() async {
    print(isFav.value);
    if (!isFav.value) {
      print('here');
      await FirebaseFirestore.instance
          .collection("product")
          .doc(productId)
          .update({
        "favorite":
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
    } else {
      await FirebaseFirestore.instance
          .collection("product")
          .doc(productId)
          .update({
        "favorite":
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
      });

      print("Favirote id " + productId);
    }
    isFav(!isFav.value);
  }

//   addFavorite(docId) async {
//     await FirebaseFirestore.instance.collection("product").doc(docId).set({
//       "favorite":
//           FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
//     }, SetOptions(merge: true));

//     // isFav(true);
//   }

// //  Remove Favorite...

//   removeFromFavorite(docId) async {
//     await FirebaseFirestore.instance.collection("product").doc(docId).set({
//       "favorite":
//           FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
//     }, SetOptions(merge: true));
//     // isFav(false);
//   }

//check if id are availbe in favorite

  checkIfFav(data) async {
    if (data['favorite'].contains(FirebaseAuth.instance.currentUser!.uid)) {
      // isFav(true);
    } else {
      // isFav(false);
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
