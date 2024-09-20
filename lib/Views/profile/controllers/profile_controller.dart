import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/profile/views/profile_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final UserController userController = Get.find<UserController>();
  RxString ImagePath = "".obs;
  var image;
  var imageUrl = "".obs;
  final ImagePicker picker = ImagePicker();
  var isLoading = false.obs;
  RxBool isSelectedOption = false.obs;

//..........................Navigation Route............
void naviagteToProfileScreen(){
                            Get.to(() => ProfileDetail());

}

  void switchChange(bool value) {
    isSelectedOption.value = value;
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
      userController.getUser();
      Get.back();
    }
  }

  updateUser() async {
    try {
      if (userController.nameController.text.isEmpty) {
        userController.nameController.text = userController.user['name'];
      }
      if (userController.phoneController.text.isEmpty) {
        userController.phoneController.text =
            userController.user['phoneNumber'];
      }
      if (userController.emailController.text.isEmpty) {
        userController.emailController.text = userController.user['email'];
      }

      isLoading(false);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': userController.nameController.text,
        'phoneNumber': userController.phoneController.text,
        'email': userController.emailController.text
      });
      userController.getUser();
      Get.back();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
