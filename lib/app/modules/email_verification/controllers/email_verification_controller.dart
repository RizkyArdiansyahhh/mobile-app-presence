import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final isLoading = false.obs;
  var isVerified = false.obs;

  Future<bool> resendEmailVerified() async {
    isLoading.value = true;
    try {
      await auth.currentUser!.sendEmailVerification();

      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar(
        "Terjadi kesalahan",
        "to many request",
        duration: Duration(milliseconds: 1500),
      );
      return false;
    } catch (e) {
      print("Terjadi kesalahan : $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void checkEmailVerified() async {
    isLoading.value = true;
    try {
      await auth.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user!.emailVerified) {
        isVerified.value = !isVerified.value;
      } else {
        Get.snackbar(
          "Peringatan",
          "Email anda masih belum di verifikasi",
          duration: Duration(milliseconds: 1500),
        );
      }
    } catch (e) {
      print("Terjadi kesalahan : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
