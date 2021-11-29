import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_profile_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_tables_controller.dart';


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

class AdminTablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminTablesController());
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
