import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/order/views/order_detail.dart';
import 'package:coffe_app/Views/payment/controllers/payment_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  var documentLength = [].obs;
  RxBool isLoading = false.obs;

  CartController cartController = Get.find<CartController>();
  PaymentsController paymentsController = Get.find<PaymentsController>();
  RxInt totalPrice = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getOrdersData();
    print("Cart data ${cartController.carts}");
  }

  void addOrdersData() async {
    try {
      DocumentReference documentRef =
          await FirebaseFirestore.instance.collection("orders").add({
        'products': cartController.carts,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'pending',
        'orderId': 'pending',
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
      String documentId = documentRef.id;
      await documentRef.update({'orderId': documentId});
      await FirebaseFirestore.instance
          .collection('orders')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

//

  Future<void> getOrdersData() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('orders')
            .where('userId', isEqualTo: uid)
            .get();
        orders.clear();
        for (var doc in querySnapshot.docs) {
          orders.add(doc);
        }
        print(FirebaseAuth.instance.currentUser!.uid);
        print('Orders count: ${orders.length}');
        print('Orders data: ${orders.toString()}');
      }
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  void calculateTotalPrice(int orderIndex) {
    totalPrice.value = 0;
    print("Calculating total price...");
    for (var i = 0; i < orders[orderIndex]['products'].length; i++) {
      if (orders[orderIndex]['products'][i].containsKey('coffee_price')) {
        totalPrice =
            totalPrice + orders[orderIndex]['products'][i]['coffee_price'];
      }
      print("total price ${totalPrice}");
      Get.to(() => OrderDetail(orderIndex));
    }
  }
}
