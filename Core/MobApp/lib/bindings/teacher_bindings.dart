import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_schedule_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_units_controller.dart';


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

class TeacherUnitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherUnitsController());
  }
}


