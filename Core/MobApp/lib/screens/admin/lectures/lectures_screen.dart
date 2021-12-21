import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Admin/admin_lectures_controller.dart';
import 'package:graduaiton_app/screens/admin/layout.dart';
import 'package:graduaiton_app/screens/general/luctures/lecture_widget.dart';

class AdminLecturesScreen extends GetView {
  AdminLecturesScreen({Key? key}) : super(key: key);

  @override
  AdminLecturesController controller = AdminLecturesController();

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(title: 'Lectures', child: Container());
  }
}
