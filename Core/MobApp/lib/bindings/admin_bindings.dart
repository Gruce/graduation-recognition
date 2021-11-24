import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/login_controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminHomeController());
  }
}
