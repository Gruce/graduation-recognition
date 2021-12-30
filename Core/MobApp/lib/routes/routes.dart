import 'package:get/get.dart';
import 'package:graduaiton_app/bindings/admin_bindings.dart';
import 'package:graduaiton_app/bindings/auth_binding.dart';
import 'package:graduaiton_app/bindings/general_bindings.dart';
import 'package:graduaiton_app/bindings/student_bindings.dart';
import 'package:graduaiton_app/bindings/teacher_bindings.dart';
import 'package:graduaiton_app/controllers/Admin/admin_lectures_controller.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/lectures/lectures_screen.dart';
import 'package:graduaiton_app/screens/admin/people/people_screen.dart';
import 'package:graduaiton_app/screens/admin/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/admin/students/students_screen.dart';
import 'package:graduaiton_app/screens/general/notification/general_notification.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_widget.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/student/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/student/lectures/lectures_of_week.dart';
import 'package:graduaiton_app/screens/student/profile/profile_screen.dart';
import 'package:graduaiton_app/screens/student/subject/subjects_student.dart';
import 'package:graduaiton_app/screens/teacher/Attendance/attendance_screen.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';
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
  static const adminNotification = '/admin/notification/';
  static const adminLectures = '/admin/lectures/';

  //Teach Routes
  static const teacherMain = '/teacher/';
  static const teachTables = '/teacher/tables/';
  static const teachAttendance = '/teacher/attendance/';
  static const teachUnits = '/teacher/units/';
  static const teachProfile = '/teacher/profile/';

  //Student
  static const studentMain = '/student/';
  static const studentProfile = '/student/profile';
  static const studentLectures = '/student/lectures';
  static const subjectsStudent = '/student/subjects';
  
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

    GetPage(
        name: adminNotification,
        page: () => GeneralNotification(),
        binding: AdminProfileBinding()),

    GetPage(
        name: adminLectures,
        page: () => AdminLecturesScreen(),
        binding: AdminLecturesBinding()),

    // Teacher Routes
    GetPage(
        name: teacherMain,
        page: () => TeacherHomeScreen(),
        binding: TeacherHomeBinding()),

    GetPage(
        name: teachAttendance,
        page: () =>  TeacherAttendanceScreen(),
        binding: TeacherAttendanceBinding()),

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
        name: studentProfile,
        page: () => StudentProfileScreen(),
        binding: StudentProfileBinding()),
  ];
}
