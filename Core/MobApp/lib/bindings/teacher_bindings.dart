import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/screens/teacher/tables_page/tables_screen.dart';

class TeacherLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherLayoutController());
  }
}

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherHomeController());
  }
}

class TeacherTablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherTablesScreen());
  }
}

class TeacherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherProfileController());
  }
}


