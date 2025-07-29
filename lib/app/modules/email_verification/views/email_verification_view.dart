import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/email_verified.png",
              width: Get.width / 1.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    (!controller.isVerified.value)
                        ? "Verofikasi Email Anda"
                        : "Email Berhasil diverifikasi",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  );
                }),
              ],
            ),
            Obx(() {
              return SizedBox(
                width: Get.width / 1.2,
                child: (!controller.isVerified.value)
                    ? Text.rich(
                        TextSpan(
                          text: "Kami telah mengirimkan tautan verifikasi ke ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: controller.auth.currentUser!.email ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ". Silakan buka email tersebut dan klik tautan untuk memverifikasi akun Anda.",
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      )
                    : SizedBox.shrink(),
              );
            }),
            SizedBox(height: 15),
            Obx(() {
              return (!controller.isVerified.value)
                  ? SizedBox(
                      width: Get.width / 1.5,
                      child: ElevatedButton(
                        onPressed: () async {
                          final resend = await controller.resendEmailVerified();
                          if (resend) {
                            return Get.dialog(
                              AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text(
                                  "Email Terkirim!",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  "Kami telah mengirimkan ulang tautan verifikasi ke email Anda. Silakan periksa kotak masuk atau folder spam Anda.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Get.back(), // menutup dialog
                                    child: const Text("Oke"),
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
                          "Kirim Ulang Tautan",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink();
            }),
            SizedBox(
              width: Get.width / 1.5,
              child: Obx(() {
                return (!controller.isVerified.value)
                    ? ElevatedButton(
                        onPressed: () {
                          controller.checkEmailVerified();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff386641),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Reload",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff386641),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
