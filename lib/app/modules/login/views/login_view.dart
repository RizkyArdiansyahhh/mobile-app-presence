import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/widgets/input_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:presence_app/app/widgets/loading_progress_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height / 1.8,
            decoration: BoxDecoration(
              color: const Color(0xff386641),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(300)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Container(
                width: double.infinity,
                height: Get.height / 1.2,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Hello",
                          style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        Text(
                          "Welcome Back!",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Login Account",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Masuk untuk mulai menggunakan sistem presensi berbasis cloud yang aman dan terpercaya.",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  InputWidget(
                                    controller: controller.emailController,
                                    obscureText: false,
                                    label: "Email",
                                    icon: const Icon(Icons.email),
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 20),
                                  Obx(() {
                                    return InputWidget(
                                      controller: controller.passwordController,
                                      obscureText:
                                          !controller.visibilityPassword.value,
                                      label: "Password",
                                      icon: const Icon(Icons.key),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.changeVisibilityPassword();
                                        },
                                        icon:
                                            (controller
                                                .visibilityPassword
                                                .value)
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: const Color(0xff386641),
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: const Color(0xff386641),
                                              ),
                                      ),
                                      textInputType:
                                          TextInputType.visiblePassword,
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff386641),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
