import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var isVerified = false.obs;

  Future<bool> resendEmailVerified() async {
    try {
      await auth.currentUser!.sendEmailVerification();

      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    } catch (e) {
      print("Terjadi kesalahan : $e");
      return false;
    }
  }

  void checkEmailVerified() async {
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
    }
  }
}
