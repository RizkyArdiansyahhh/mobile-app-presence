import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/modules/add_employee/controllers/employee_controller.dart';
import 'package:presence_app/app/widgets/input_widget.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff386641),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Add Employee', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff386641),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            InputWidget(
              obscureText: false,
              label: "NIP",
              icon: const Icon(Icons.badge),
              controller: controller.nipController,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            InputWidget(
              obscureText: false,
              label: "Email",
              icon: const Icon(Icons.alternate_email),
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            InputWidget(
              obscureText: false,
              label: "Nama",
              icon: const Icon(Icons.person),
              controller: controller.nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get.find<EmployeeController>().addEmployee();
                Get.bottomSheet(
                  enableDrag: false,
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 300,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Validasi Admin",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            InputWidget(
                              controller: controller.passAdminController,
                              icon: const Icon(Icons.key),
                              obscureText: true,
                              label: "Password",
                              textInputType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.find<EmployeeController>().addEmployee();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff386641),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Lanjutkan",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -50,
                        right: 0,
                        child: Material(
                          shape: const CircleBorder(),
                          elevation: 4,
                          color: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () => Get.back(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff386641),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Tambah",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
