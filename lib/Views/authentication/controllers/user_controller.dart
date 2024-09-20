import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/authentication/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = {}.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    getUser();
  }

  void getUser() async {
    try {
      isLoading(true);
      if (FirebaseAuth.instance.currentUser != null) {
        var usr = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        print(usr.data());
        user(usr.data());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
