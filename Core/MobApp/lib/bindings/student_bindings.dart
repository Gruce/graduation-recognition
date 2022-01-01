import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/lectures_week_screen_controller.dart';
import 'package:graduaiton_app/controllers/Student/student_change_stage_controller.dart';
import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';
import 'package:graduaiton_app/controllers/student/student_home_controller.dart';
import 'package:graduaiton_app/controllers/student/student_layout_controller.dart';
import 'package:graduaiton_app/controllers/student/student_profile_controller.dart';

class StudentLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentLayoutController());
  }
}

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentHomeController());
  }
}

class SubjectsStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubjectsStudentController());
  }
}

class LecturesWeekScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LecturesWeekScreenController());
  }
}

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentProfileController());
  }
}

class ChangeStageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeStageController());
  }
}
