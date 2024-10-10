import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var orderFee = 5.obs;
  var gst = 5.obs;
  var carts = [].obs;
  var totalPrice = 0.obs;
  var subTotalPrice = 0.obs;
  RxBool isLoading = false.obs;
  // var deletedItemsCount = 0.obs;
  String? uid;
  @override
  void onInit() {
    super.onInit();
   getCartData();
  }

  addToCart(
      {required String coffee_img,
      required int coffee_price,
      required String uid,
      required String name}) async {
    try {
      await FirebaseFirestore.instance.collection("cart").add({
        "coffee_img": coffee_img,
        "coffee_price": coffee_price,
        "id": uid,
        "name": name,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void getCartData() async {
    print('get acrt');
    try {
      carts.clear();
      var querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (var doc in querySnapshot.docs) {
        carts.add(doc.data());
      }
      print(FirebaseAuth.instance.currentUser!.uid);
      print("length of carts  ${carts.length}");
      print("object");
      calculateTotalPrice();
      // calculate();
      calulateSubtotal();
    } catch (e) {
      print(e.toString());
    }
  }

  void calculateTotalPrice() {
    print("priceeee");
    for (var i = 0; i < carts.length; i++) {
      totalPrice += carts[i]['coffee_price'];
    }
    print("Total price... ${totalPrice.value}");
  }

  void calulateSubtotal() {
    int gst = 150;
    int orderFee = 5;
    subTotalPrice = totalPrice + gst + orderFee;
    print("Total price ${subTotalPrice.value}");
  }

  // void deleteAllDocuments() async {
  //   try {
  //     isLoading.value = true;
  //     var snapshot = await FirebaseFirestore.instance.collection('carts').get();

  //     for (var doc in snapshot.docs) {
  //       await FirebaseFirestore.instance
  //           .collection('carts')
  //           .doc(doc.id)
  //           .delete();
  //       deletedItemsCount.value++;
  //     }

  //     print("All documents deleted successfully.");
  //   } catch (e) {
  //     print("Error deleting documents: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
