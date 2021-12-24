// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/day.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class DaysFilterController extends GetxController {
  late SharedPreferences prefs;
  RxList days = <LectureModel>[].obs;
  RxInt daySelectedIndex = 0.obs;

  LucturesController lucturesController = Get.put(LucturesController());

  @override
  void onInit() async {
    fetchSections();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  void fetchSections() async {
    var res = await Utilities.httpGet('lectures');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      days.add(DayModel.fromJson({"id": -1, "name": "Weekly"}));
      for (var element in response) {
        print(element);
        days.add(DayModel.fromJson(element));
        print(days);
      }
    }
    update();
  }

  void filterByDay(id) {
    daySelectedIndex.value = 0;
    if (id == -1) {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures);
    } else {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures.where((day) => day.day_id == id));
    }
    lucturesController.update();
  }
}









// import 'dart:convert';

// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';
// import 'package:graduaiton_app/config.dart';
// import 'package:graduaiton_app/models/camera.dart';
// import 'package:graduaiton_app/models/schedule/lecture.dart';
// import 'package:graduaiton_app/util/utilities.dart';
// import 'package:intl/intl.dart';

// class DaysFilterController extends GetxController {
//   RxList lectures = <LectureModel>[].obs;

//   @override
//   void onInit() async {
//     fetch();
//     super.onInit();
//   }

//   void fetch() async {
//     var res = await Utilities.httpGet('lectures/' + DateFormat('EEEE').format(DateTime.now()));
//     if (res.statusCode == 200) {
//       List response = json.decode(res.body)['data'];
//       for (var element in response) {
//         lectures.add(LectureModel.fromJson(element));
//       }
//     }
//   }

// }
