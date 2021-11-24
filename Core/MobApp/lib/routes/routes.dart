import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/auth_binding.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/layout.dart';
import 'package:graduaiton_app/screens/admin/tables_page/tables_screen.dart';
import 'package:graduaiton_app/screens/login_screen.dart';

class Routes {
  static const login = '/';
  static const adminMain = '/admin/';
  static const adminTables = '/admin/tables';

  static final routes = [
    // Auth Routes
    GetPage(
        name: login, page: () => const LoginScreen(), binding: LoginBinding()),

    // Admin Routes
    GetPage(
        name: adminMain,
        page: () => const AdminLayoutScreen(),
        binding: AdminLayoutBinding()),

    GetPage(
        name: adminTables,
        page: () => const AdminTablesScreen(),
        binding: AdminTablesBinding()),
  ];
}
