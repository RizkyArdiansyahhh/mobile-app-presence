import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import 'package:presence_app/app/widgets/input_widget.dart';
import 'package:presence_app/app/widgets/loading_progress_widget.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/update_password.png",
                  width: Get.width / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Password Anda",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width / 1.1,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Untuk menjaga keamanan akun Anda, silakan masukkan kata sandi baru yang kuat dan mudah Anda ingat. Pastikan kata sandi terdiri dari minimal 6!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Obx(() {
                    return InputWidget(
                      controller: controller.newPasswordController,
                      obscureText: !controller.visibilityPassword.value,
                      label: "Password",
                      icon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changeVisibilityPassword();
                        },
                        icon: (controller.visibilityPassword.value)
                            ? Icon(
                                Icons.visibility_off,
                                color: const Color(0xff386641),
                              )
                            : Icon(
                                Icons.visibility,
                                color: const Color(0xff386641),
                              ),
                      ),
                      textInputType: TextInputType.visiblePassword,
                    );
                  }),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final isSuccess = await controller.updatePassword();
                        if (isSuccess) {
                          return Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: const Text(
                                "Berhasil",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                "Passoword anda berhasil diubah, jangan beri tahu orang lain!",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.offAllNamed(
                                    Routes.HOME,
                                  ), // menutup dialog
                                  child: const Text("Continue"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff386641),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return LoadingProgressWidget(
              controller: controller.isLoading.value,
            );
          }),
        ],
      ),
    );
  }
}
