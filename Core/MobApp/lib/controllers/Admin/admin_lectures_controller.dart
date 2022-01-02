import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lectuer.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';
import 'package:graduaiton_app/util/utilities.dart';


class AdminLecturesController extends GetxController {
  RxList lectures = <LectureModel>[].obs;
  RxInt lectureSelectedIndex = 0.obs;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('lectures');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        lectures.add(LectureModel.fromJson(element));
      }
    }
  }
  void filterByLecture(i) {
    lectureSelectedIndex.value = i;
    if (i == -1) {
      lectures.assignAll(lectures);
    } else {
      lectures.assignAll(lectures.where((subject) => subject.subject_id == i));
    }
    update();
  }
}
