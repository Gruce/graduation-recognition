import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/util/utilities.dart';

class StudentLecturesController extends GetxController{
RxList lectures = <LectureModel>[].obs;






 @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('student/lectures/a');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];

      for (var element in response) {
         
        lectures.add(LectureModel.fromJson(element));
            print(element);
        print(
            '===============================================================');
      }
    }

    update();
  }

}