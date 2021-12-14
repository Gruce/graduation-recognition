import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/auth_binding.dart';
import 'package:graduaiton_app/bindings/general_bindings.dart';
import 'package:graduaiton_app/bindings/teacher_bindings.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/people/people_screen.dart';
import 'package:graduaiton_app/screens/admin/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/admin/students/students_screen.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_widget.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/teacher/home_page/schedule_teacher.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/teacher/units/units_screen.dart';

class Routes {
  static const login = '/';

  //General Routes
  static const personProfile = '/general/person/profile/';

  //Admin Routes
  static const adminMain = '/admin/';
  static const adminProfile = '/admin/profile/';
  static const adminPeople = '/admin/people/';
  static const adminStudents = '/admin/students/';

  //Teach Routes
  static const teacherMain = '/teacher/';
  static const teachTables = '/teacher/tables/';
  static const teachSchedule = '/teacher/schedule/';
  static const teachUnits = '/teacher/units/';
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
        page: () => AdminHomeScreen(),
        binding: AdminHomeBinding()),

    // GetPage(
    //     name: adminTables,
    //     page: () => const AdminTablesScreen(),
    //     binding: AdminTablesBinding()),

    GetPage(
        name: adminProfile,
        page: () => AdminProfileScreen(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminPeople,
        page: () => AdminPeopleScreen(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminStudents,
        page: () => AdminStudentsScreen(),
        binding: AdminProfileBinding()),

    // Teacher Routes
    GetPage(
        name: teacherMain,
        page: () => TeacherHomeScreen(),
        binding: TeacherHomeBinding()),

    GetPage(
        name: teachSchedule,
        page: () => const TeacherScheduleScreen(),
        binding: TeacherScheduleScrBinding()),

    GetPage(
        name: teachProfile,
        page: () => TeacherProfileScreen(),
        binding: TeacherProfileBinding()),

    GetPage(
        name: teachUnits,
        page: () => TeacherUnitsScreen(),
        binding: TeacherUnitsBinding()),
  ];
}
