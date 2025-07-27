import 'package:get/get.dart';

import 'package:presence_app/app/modules/add_employee/bindings/add_employee_binding.dart';
import 'package:presence_app/app/modules/add_employee/views/add_employee_view.dart';
import 'package:presence_app/app/modules/home/bindings/home_binding.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
  ];
}
