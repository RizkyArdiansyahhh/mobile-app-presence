import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/add_employee/controllers/add_employee_controller.dart';

class EmployeeController extends GetxController {
  final AddEmployeeController addEmployeeController =
      Get.find<AddEmployeeController>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message, duration: const Duration(milliseconds: 1500));
  }

  void addEmployee() async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: addEmployeeController.emailController.text,
        password: "password",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnackbar("Terjadi Kesalahan", "The password provided is too weak.");
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
}
