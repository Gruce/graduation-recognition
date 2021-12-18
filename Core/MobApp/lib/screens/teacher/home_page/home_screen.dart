import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/circular_progress.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../layout.dart';


class TeacherHomeScreen extends GetView {
  TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  TeacherHomeController controller = Get.put(TeacherHomeController());

  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
      title: 'Home',
      child: Obx( () => controller.isLectureStarted.value ? DeterminatePage() : Container(child: Column(children: [
        Text("Not started"),
        MyButton(label: "Start Lecture", onTap: controller.startLecture)
      ],))),
    );
  }
}
