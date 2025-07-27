import 'package:get/get.dart';

import 'package:presence_app/app/modules/add_employee/controllers/employee_controller.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeController>(
      () => EmployeeController(),
    );
    Get.lazyPut<AddEmployeeController>(
      () => AddEmployeeController(),
    );
  }
}
