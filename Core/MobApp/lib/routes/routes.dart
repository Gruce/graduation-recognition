import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/auth_binding.dart';
import 'package:graduaiton_app/bindings/general_bindings.dart';
import 'package:graduaiton_app/bindings/student_bindings.dart';
import 'package:graduaiton_app/bindings/teacher_bindings.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/lectures/lectures_screen.dart';
import 'package:graduaiton_app/screens/admin/lucturers/lucturers_screen.dart';
import 'package:graduaiton_app/screens/admin/notification/notification.dart';
import 'package:graduaiton_app/screens/admin/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/admin/students/students_screen.dart';
import 'package:graduaiton_app/screens/admin/users/users_screen.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_widget.dart';
import 'package:graduaiton_app/screens/general/people/student_absences_widget.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/student/changeStage/change_Stage.dart';
import 'package:graduaiton_app/screens/student/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/student/lectures/lectures_of_week.dart';
import 'package:graduaiton_app/screens/student/profile/profile.dart';
import 'package:graduaiton_app/screens/student/subject/subjects_student.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/teacher/notification/notification_screen.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/teacher/units/units_screen.dart';

class Routes {
  static const login = '/';

  //General Routes
  static const personProfile = '/general/person/profile/';

  //Admin Routes
  static const adminMain = '/admin/';
  static const adminProfile = '/admin/profile/';
  static const adminLucurers = '/admin/lucurers/';
  static const adminStudents = '/admin/students/';
  static const adminNotification = '/admin/notification/';
  static const adminStudentAbsences = '/general/student/Absences';
  static const adminLectures = '/admin/lectures/';
  static const adminUsers = '/admin/users/';

//Teach Routes
  static const teacherMain = '/teacher/';
  static const teachTables = '/teacher/tables/';
  static const teacherNotification = '/teacher/notification/';
  static const teachUnits = '/teacher/units/';
  static const teachProfile = '/teacher/profile/';

  //Student
  static const studentMain = '/student/';
  static const studentProfile = '/student/profile';
  static const studentLectures = '/student/lectures';
  static const subjectsStudent = '/student/subjects';
  static const x = '/student/x';

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
        name: adminStudents,
        page: () => AdminStudentsScreen(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminNotification,
        page: () => AdminNotification(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminStudentAbsences,
        page: () => AdminStudentAbsences(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminLucurers,
        page: () => AdminLucurersScreen(),
        binding: AdminLucurersBinding()),

    GetPage(
        name: adminLectures,
        page: () => AdminLecturesScreen(),
        binding: AdminLecturesBinding()),

    GetPage(
        name: adminUsers,
        page: () => AdminUsersScreen(),
        binding: AdminUsersBinding()),

    // Teacher Routes
    GetPage(
        name: teacherMain,
        page: () => TeacherHomeScreen(),
        binding: TeacherHomeBinding()),

    GetPage(
        name: teacherNotification,
        page: () => TeacherNotification(),
        binding: TeacherNotificationBinding()),

    GetPage(
        name: teachProfile,
        page: () => TeacherProfileScreen(),
        binding: TeacherProfileBinding()),

    GetPage(
        name: teachUnits,
        page: () => TeacherUnitsScreen(),
        binding: TeacherUnitsBinding()),

    // Student Routes
    GetPage(
        name: studentMain,
        page: () => StudentHomeScreen(),
        binding: StudentHomeBinding()),

    GetPage(
        name: subjectsStudent,
        page: () => SubjectStudentScreen(),
        binding: SubjectsStudentBinding()),

    GetPage(
        name: studentLectures,
        page: () => LecturesWeekScreen(),
        binding: LecturesWeekScreenBinding()),

    GetPage(
        name: x,
        page: () => ChangeStageScreen(),
        binding: ChangeStageScreenBinding()),

    GetPage(
        name: studentProfile,
        page: () => StudentsProfileScreen(),
        binding: StudentProfileBinding()),
  ];
}
