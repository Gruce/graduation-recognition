import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/auth_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
