import 'package:get/get.dart';


import 'package:graduaiton_app/screens/general/people/person_profile_controller.dart';

class PersonProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonProfileController());
  }
}
