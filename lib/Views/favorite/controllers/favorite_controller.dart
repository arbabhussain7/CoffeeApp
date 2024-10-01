import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffe_app/Views/home/controllers/description_controller.dart';
// import 'package:coffe_app/Views/home/controllers/description_controller.dart';

import 'package:coffe_app/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  // DescriptionController descriptionController =
  //     Get.find<DescriptionController>();

  getfavorites() async {
    try {
      isLoading(true);
      favorites.clear();
      var querySnapshot = await FirebaseFirestore.instance
          .collection('product')
          .where('favorite',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (var doc in querySnapshot.docs) {
        favorites.add(ProductModel.fromJson(doc.data()));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
