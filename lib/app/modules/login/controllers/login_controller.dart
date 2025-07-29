import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  var visibilityPassword = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void changeVisibilityPassword() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message, duration: const Duration(milliseconds: 1500));
  }

  void login() async {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        print(credential.user);
        if (!credential.user!.emailVerified) {
          await credential.user!.sendEmailVerification();
          Get.toNamed(Routes.EMAIL_VERIFICATION);
        } else if (passwordController.text == "password") {
          Get.toNamed(Routes.NEW_PASSWORD);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          showSnackbar("Terjadi kesalahan", "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          showSnackbar(
            "Terjadi kesalahan",
            "Wrong password provided for that user.",
          );
        }
      } catch (e) {
        print("Terjadi kesalahan : $e");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
