import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  RxBool isLoading = false.obs;

  var totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getOrdersData();
  }

  void addOrdersData() async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc().update({
        "coffee_img": FieldValue.arrayUnion([]),
        "coffee_price": FieldValue.arrayUnion([]),
        "id": FieldValue.arrayUnion([]),
        "name": FieldValue.arrayUnion([]),
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void getOrdersData() async {
    print('get acrt');
    try {
      orders.clear();
      var querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (var doc in querySnapshot.docs) {
        orders.add(doc.data());
      }
      print(FirebaseAuth.instance.currentUser!.uid);
      print(orders.length);
      print("object");

      calculateOrders();
    } catch (e) {
      print(e.toString());
    }
  }

  void calculateOrders() {
    print("priceeee");
    for (var i = 0; i < orders.length; i++) {
      totalPrice += orders[i]['coffee_price'];
    }
  }
}
