// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_lectures_controller.dart';
import 'package:graduaiton_app/models/schedule/day.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DayFilterController extends GetxController {
  late SharedPreferences prefs;
  RxList days = <DayModel>[].obs;
  RxInt daySelectedIndex = 0.obs;

  StudentLecturesController lecturesController =
      Get.put(StudentLecturesController());

  @override
  void onInit() async {
    fetchDays();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  void fetchDays() async {
    var res = await Utilities.httpGet('student/lectures/days');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      days.add(DayModel.fromJson({"id": -1, "name": "Weekly"}));
      for (var element in response) {
        days.add(DayModel.fromJson(element['day']));
      }
    }
    lecturesController.update();
    update();
  }

  void filterByDay(i) {
    daySelectedIndex.value = i;
    if (i == -1) {
      lecturesController.lecturesWeek
          .assignAll(lecturesController.lecturesWeek);
    } else {
      lecturesController.lecturesWeek.assignAll(
          lecturesController.lecturesWeek.where((day) => day.day_id == i));
    }
    lecturesController.update();
    update();
  }
}
