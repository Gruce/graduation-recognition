import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/student/student_home_controller.dart';
import 'package:graduaiton_app/screens/student/layout.dart';


class StudentHomeScreen extends GetView {
  StudentHomeScreen({Key? key}) : super(key: key);

  @override
  StudentHomeController controller = Get.put(StudentHomeController());

  @override
  Widget build(BuildContext context) {
    return StudentLayoutScreen(
        title: 'Home',
        child: Container(
          child: Text('hgh'),
        ));
  }
}
