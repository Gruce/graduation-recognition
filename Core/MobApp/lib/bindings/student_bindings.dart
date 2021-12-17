import 'package:get/get.dart';
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



class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentProfileController());
  }
}





