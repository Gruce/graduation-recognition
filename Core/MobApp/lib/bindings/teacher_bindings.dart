import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/attendance_students.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_schedule_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/schedule_teacher.dart';


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

// class TeacherTablesBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => TeacherTablesScreen());
//   }
// }
class AttendanceStudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceStudentsController());
  }
}
class TeacherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherProfileController());
  }
}
class TeacherScheduleScrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherScheduleController());
  }
}


