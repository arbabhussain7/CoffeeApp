import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  var product = {}.obs;
  void getUser() async {
    try {
      isLoading(true);

      var usr =
          await FirebaseFirestore.instance.collection('product').doc().get();
      print(usr.data());
      product(usr.data());
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
