import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddEmployeeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddEmployeeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
