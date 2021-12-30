import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AttendanceStudentsController extends GetxController {
  late SharedPreferences prefs;
  List absentStudents = [];

  void toggleAbsentStudent(id, value) {
    int i = absentStudents.indexWhere((e) => e == id);
    if (i == -1) {
      absentStudents.add(id);
    } else {
      absentStudents.removeAt(i);
    }
  }
}
