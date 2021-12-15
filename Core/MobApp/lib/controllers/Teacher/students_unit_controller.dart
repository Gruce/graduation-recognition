import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:graduaiton_app/models/student_models/student.dart';

import 'package:graduaiton_app/util/utilities.dart';

class TeacherStudentsUnitController extends GetxController {
  RxList students = <StudentModel>[].obs;

  @override
 

  void fetch(id) async {
    students.clear();
    var res = await Utilities.httpGet('teacher/unit/' + id.toString());
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'][0]['units'][0]['students'];
      for (var element in response) {
        students.add(StudentModel.fromJson(element));
      }
    }
    update();
  }
}
