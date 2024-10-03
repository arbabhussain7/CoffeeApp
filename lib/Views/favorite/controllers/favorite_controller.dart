import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favorites = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  var isFav = false.obs;

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

  void toggleFavorite(ProductModel prod) async {
    if (!prod.favorite!.contains(FirebaseAuth.instance.currentUser!.uid)) {
      print('here');
      await FirebaseFirestore.instance
          .collection("product")
          .doc(prod.id)
          .update({
        "favorite":
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
    } else {
      await FirebaseFirestore.instance
          .collection("product")
          .doc(prod.id)
          .update({
        "favorite":
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
      });
    }
    getfavorites();
  }
}
