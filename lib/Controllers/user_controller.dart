import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = {}.obs;
  RxString ImagePath = "".obs;
  var image;
  var imageUrl = "".obs;
  final ImagePicker picker = ImagePicker();
  @override
  onInit() {
    super.onInit();
    getUser();
  }

  getImage() async {
    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        ImagePath.value = image.path.toString();
        await uploadImage();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  uploadImage() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    if (image == null) return;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceDirImages = referenceRoot.child('image');
    Reference referenceImgeToUpload = referenceDirImages.child(uniqueFileName);
    await referenceImgeToUpload.putFile(File(ImagePath.value));
    imageUrl.value = (await referenceImgeToUpload.getDownloadURL());
    Get.log(imageUrl.value);
    if (FirebaseAuth.instance.currentUser != null) {
      var usr = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'imageUrl': imageUrl.value});
      print(imageUrl.value);
      getUser();
      Get.back();
    }
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
