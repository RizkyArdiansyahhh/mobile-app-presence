import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController {
  //TODO: Implement AddEmployeeController
  late final TextEditingController nameController;
  late final TextEditingController nipController;
  late final TextEditingController emailController;
  late final TextEditingController passAdminController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    nipController = TextEditingController();
    emailController = TextEditingController();
    passAdminController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    nipController.dispose();
    emailController.dispose();
    passAdminController.dispose();
    super.onClose();
  }
}
