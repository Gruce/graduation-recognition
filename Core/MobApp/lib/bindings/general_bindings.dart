import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/admin_layout_controller.dart';
import 'package:graduaiton_app/controllers/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/admin_profile_controller.dart';
import 'package:graduaiton_app/controllers/admin_tables_controller.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_controller.dart';

class PersonProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonProfileController());
  }
}
