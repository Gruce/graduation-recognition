import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AttendanceStudentsController extends GetxController {
  RxList students = <StudentModel>[].obs;
  List absentStudents = [];

  @override
  void onInit() {
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('teacher/unit/');
    if (res.statusCode == 200) {
      List _students = json.decode(res.body)['data'];
      List _absentStudents = json.decode(res.body)['ids'];

      for (var _student in _students) {
        StudentModel student_ = StudentModel.fromJson(_student);
        if (_absentStudents.indexWhere((id) => id == student_.id) == -1) {
          absentStudents.add(student_.id);
        }
        students.add(student_);
      }
    }
    update();
  }

  void toggleAbsentStudent(id, value) {
    int i = absentStudents.indexWhere((e) => e == id);
    if (i == -1) {
      absentStudents.add(id);
    } else {
      absentStudents.removeAt(i);
    }
  }
}
