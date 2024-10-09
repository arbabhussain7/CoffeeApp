import 'dart:convert';
import 'dart:developer';

import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentsController extends GetxController {
  CartController controller = Get.find<CartController>();
  RxInt selectedOptions = 1.obs;

  void selectedOption(int index) {
    selectedOptions.value = index;
  }

  static const stripePublishableKey =
      "pk_test_51Q1nGrFHugyQIn2Jo2F4AJUICJQAYwhiZtrZZSab0MBvLUAIChcaTt8bvfQZTL0sqBpoUnq6evjsTeslbzWpwmBb00lQXUvOxN";
  final String apiKey =
      "sk_test_51Q1nGrFHugyQIn2JHZlhRarixRFCOqlbsNrOZ9BdwtrVbkD5b8G66lu151uRL73zlA07SBdvd5OTo9DMV5W6Q6U500vY4cvOil";

  Rx<bool> paymentLoading = false.obs;
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(String amount, String productId,
      {Function(Map<String, dynamic> infoData)? onSuccess,
      Function(String error)? onError}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, productId);

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              // customerId: FirebaseUtils.myId,
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              merchantDisplayName: "Arbab Hussain"));

      Map<String, dynamic> infoData = {
        "id": "${paymentIntent?["id"] ?? ""}",
        "status": "paid",
        "amount": ((paymentIntent?["amount"] ?? -100) / 100),
        "created": paymentIntent?["created"] ?? 0,
        "currency": paymentIntent?["currency"] ?? "",
        "livemode": paymentIntent?["livemode"] ?? false,
      };

      await displayPaymentSheet(onSuccess, infoData);
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet(Function(Map<String, dynamic> infoData)? onSuccess,
      Map<String, dynamic> infoData) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        paymentIntent = null;
        if (onSuccess != null) {
          onSuccess(infoData);
        }
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String productId) async {
    try {
      const String corsUrl = "https://corsproxy.io/?";
      const String baseUrl =
          '${corsUrl}https://api.stripe.com/v1/payment_intents';

      var headers = <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $apiKey',
      };

      var response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: {
          "amount": (double.parse(amount) * 100).toStringAsFixed(0),
          "currency": "PKR",
          "payment_method_types[]": "card",
          "metadata[product_id]": productId,
        },
      );

      log(response.body);

      return json.decode(response.body);
    } catch (err) {
      log(err.toString());
      throw Exception(err.toString());
    }
  }
}
