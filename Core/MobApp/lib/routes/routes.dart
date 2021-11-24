import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/login_binding.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/login_screen.dart';

class Routes {
  static const login = '/';
  static const adminHome = '/admin/';

  static final routes = [
    // Auth Routes
    GetPage(
        name: login, page: () => const LoginScreen(), binding: LoginBinding()),

    // Admin Routes
    GetPage(
        name: adminHome,
        page: () => const AdminHomeScreen(),
        binding: AdminHomeBinding()),
  ];
}
