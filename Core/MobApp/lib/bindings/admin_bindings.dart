import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_lectures_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_profile_controller.dart';

class AdminLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminLayoutController());
  }
}

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminHomeController());
  }
}

class AdminProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminProfileController());
  }
}

class AdminPeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPeopleController());
  }
}

class AdminLecturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminLecturesController());
  }
}
