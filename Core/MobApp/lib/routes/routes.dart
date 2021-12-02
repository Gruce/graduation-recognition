import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/auth_binding.dart';
import 'package:graduaiton_app/bindings/general_bindings.dart';
import 'package:graduaiton_app/bindings/teacher_bindings.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/layout.dart';
import 'package:graduaiton_app/screens/admin/people/people_screen.dart';
import 'package:graduaiton_app/screens/admin/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/admin/tables_page/tables_screen.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_widget.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/teacher/tables_page/tables_screen.dart';

class Routes {
  static const login = '/';

  //General Routes
  static const personProfile = '/general/person/profile/';

  //Admin Routes
  static const adminMain = '/admin/';
  static const adminTables = '/admin/tables/';
  static const adminProfile = '/admin/profile/';
  static const adminPeople = '/admin/people/';

   //Teach Routes
  static const teacherMain = '/teacher/';
  static const teachTables = '/teacher/tables/';
  static const teachProfile = '/teacher/profile/';

  static final routes = [
    // Auth Routes
    GetPage(
        name: login, page: () => const LoginScreen(), binding: LoginBinding()),

    // General Routes
    GetPage(
        name: personProfile,
        page: () => PersonProfileWidget(),
        binding: PersonProfileBinding()),

    // Admin Routes
    GetPage(
        name: adminMain,
        page: () => const AdminHomeScreen(),
        binding: AdminHomeBinding()),

    GetPage(
        name: adminTables,
        page: () => const AdminTablesScreen(),
        binding: AdminTablesBinding()),

    GetPage(
        name: adminProfile,
        page: () => AdminProfileScreen(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminPeople,
        page: () =>  AdminPeopleScreen(),
        binding: AdminProfileBinding()),

    
      // Teacher Routes
    GetPage(
        name: teacherMain,
        page: () =>  const TeacherHomeScreen(),
        binding: TeacherHomeBinding()),

    GetPage(
        name: teachTables,
        page: () => const TeacherTablesScreen(),
        binding: TeacherTablesBinding()),

    GetPage(
        name: teachProfile,
        page: () => TeacherProfileScreen(),
        binding: TeacherProfileBinding()),

   
  ];
}
