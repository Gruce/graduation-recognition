import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lectuer.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/util/utilities.dart';

class StudentLecturesController extends GetxController {
  RxList lecturesToday = <LectureModel>[].obs;
  RxList lecturesWeek = <LectureModel>[].obs;

  @override
  void onInit() async {
    fetch();
    fetchLecturesWeek();
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('student/lectures/today');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];

      for (var element in response) {
        lecturesToday.add(LectureModel.fromJson(element));
        // print(element);
        // print(
        //     '===============================================================');
      }
    }

    update();
  }

  void fetchLecturesWeek() async {
    var res = await Utilities.httpGet('student/lectures/');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];

      for (var element in response) {
        lecturesWeek.add(LectureModel.fromJson(element));
        // print(lecturesWeek[0].subject.name);
        // print(
        //     '===============================================================');
      }
    }

    update();
  }
}
