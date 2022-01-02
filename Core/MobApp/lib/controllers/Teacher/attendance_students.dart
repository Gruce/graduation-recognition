import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
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
    fetch();
    super.onInit();
  }

  void fetch() async {
    String currentLecture = '';
    var res = await Utilities.httpGet('teacher/current-lecture');
    if (res.statusCode == 200) {
      var response = json.decode(res.body)['data'];
      LectureModel lecture = LectureModel.fromJson(response);
      currentLecture = lecture.id.toString();
    }

    res = await Utilities.httpGet('teacher/students-absence/' + currentLecture);
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

    print("========================");
    for (StudentModel st in students) {
      // print(st.user.name);
    }
    update();
  }

  void send() async {
    String currentLecture = '';
    var res = await Utilities.httpGet('teacher/current-lecture');
    if (res.statusCode == 200) {
      var response = json.decode(res.body)['data'];
      LectureModel lecture = LectureModel.fromJson(response);
      currentLecture = lecture.id.toString();
    }

    var res1 = await Utilities.httpPost(
        'teacher/send-students-absence/' + currentLecture,
        {'ids': jsonEncode(absentStudents)});
    Get.snackbar(' Done ', 'Attendance have been taken Successfully',
        backgroundColor: Colors.green[200], icon: Icon(Icons.done));
    update();
  }

  void toggleAbsentStudent(id, value) {
    int i = absentStudents.indexWhere((e) => e == id);
    if (i == -1) {
      absentStudents.add(id);
    } else {
      absentStudents.removeAt(i);
    }
    update();
  }
}
