import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/admin_layout_controller.dart';
import 'package:graduaiton_app/controllers/admin_tables_controller.dart';

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
