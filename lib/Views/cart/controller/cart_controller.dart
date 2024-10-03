import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/payment/controllers/payment_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

CartController controllers = Get.put(CartController());

PaymentsController controllor = Get.find<PaymentsController>();

class CartController extends GetxController {
  var orderFee = 5.obs;
  var gst = 5.obs;
  var carts = [].obs;
  var totalPrice = 0.obs;
  var subTotalPrice = 0.obs;
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
      print(carts.length);
      print("object");

      calculate();
      calulateSubtotal();
    } catch (e) {
      print(e.toString());
    }
  }

  void calculate() {
    print("priceeee");
    for (var i = 0; i < carts.length; i++) {
      totalPrice += carts[i]['coffee_price'];
      // int.parse(carts[i]["coffee_price"].toString());
    }
  }

  void calulateSubtotal() {
    int gst = 5;
    int orderFee = 5;
    subTotalPrice = totalPrice + gst + orderFee;
  }
}
