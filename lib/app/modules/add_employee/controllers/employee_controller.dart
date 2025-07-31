import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/add_employee/controllers/add_employee_controller.dart';

class EmployeeController extends GetxController {
  final AddEmployeeController addEmployeeController =
      Get.find<AddEmployeeController>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final User? adminCredential = FirebaseAuth.instance.currentUser;

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message, duration: const Duration(milliseconds: 1500));
  }

  void addEmployee() async {
    if (addEmployeeController.passAdminController.text.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(
          email: adminCredential!.email!,
          password: addEmployeeController.passAdminController.text,
        );
        if (addEmployeeController.nipController.text.isNotEmpty &&
            addEmployeeController.emailController.text.isNotEmpty &&
            addEmployeeController.nameController.text.isNotEmpty) {
          try {
            final credential = await auth.createUserWithEmailAndPassword(
              email: addEmployeeController.emailController.text,
              password: "password",
            );

            if (credential.user != null) {
              String uid = credential.user!.uid;
              print(credential.user);

              try {
                await firestore.collection("employees").doc(uid).set({
                  "nip": addEmployeeController.nipController.text,
                  "email": addEmployeeController.emailController.text,
                  "name": addEmployeeController.nameController.text,
                  "password": "Password",
                  "created_At": DateTime.now().toIso8601String(),
                  "uid": uid,
                });

                await credential.user!.sendEmailVerification();
                print(credential.user);

                showSnackbar("Berhasil", "Karyawan Berhasil Ditambahkan");
                auth.signOut();
                auth.signInWithEmailAndPassword(
                  email: adminCredential!.email!,
                  password: addEmployeeController.passAdminController.text,
                );
              } catch (e) {
                showSnackbar("Terjadi kesalahan", "Kesalahan : $e");
              }
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
              showSnackbar(
                "Terjadi Kesalahan",
                "The password provided is too weak.",
              );
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
              showSnackbar(
                "Terjadi Kesalahan",
                "The account already exists for that email.",
              );
            } else if (e.code == "invalid-email") {
              print("Format email tidak valid.");
              showSnackbar("Terjadi Kesalahan", "TFormat email tidak valid.");
            }
          } catch (e) {
            print(e);
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password") {
          showSnackbar("Terjadi kesalahan", "Password anda salah");
        } else {
          showSnackbar("Terjadi kesalahan", e.code);
        }
      }
    } else {
      showSnackbar("Terjadi kesalahan", "Password tidak boleh kosong");
    }
  }
}
