import 'package:get/get.dart';

import 'package:presence_app/app/modules/add_employee/bindings/add_employee_binding.dart';
import 'package:presence_app/app/modules/add_employee/views/add_employee_view.dart';
import 'package:presence_app/app/modules/email_verification/bindings/email_verification_binding.dart';
import 'package:presence_app/app/modules/email_verification/views/email_verification_view.dart';
import 'package:presence_app/app/modules/home/bindings/home_binding.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/modules/login/bindings/login_binding.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';
import 'package:presence_app/app/modules/new_password/bindings/new_password_binding.dart';
import 'package:presence_app/app/modules/new_password/views/new_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
  ];
}
