import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  late final TextEditingController newPasswordController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var visibilityPassword = false.obs;

  void changeVisibilityPassword() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  Future<bool> updatePassword() async {
    final password = newPasswordController.text.trim();
    if (password.isNotEmpty && password.length >= 6) {
      if (password != "password") {
        try {
          await auth.currentUser!.updatePassword(password);
          return true;
        } on FirebaseAuthException catch (e) {
          Get.snackbar(
            "Terjadi Kesalahan",
            "$e",
            duration: const Duration(milliseconds: 1600),
          );
          print("Terjadi Kesalahan : $e");
          return false;
        } catch (e) {
          print("Terjadi Kesalahan : $e");
          return false;
        }
      } else {
        Get.snackbar(
          "Terjadi kesalahan",
          "password tidak boleh default",
          duration: const Duration(milliseconds: 1600),
        );
        return false;
      }
    } else {
      Get.snackbar(
        "Terjadi Kesalahan",
        "Password tidak boleh kosong dan minimal 6 karakter",
        duration: const Duration(milliseconds: 1600),
      );
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    newPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    super.onClose();
  }
}
