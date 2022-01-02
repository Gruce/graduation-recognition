import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/absences.dart';
import 'package:graduaiton_app/models/schedule/subject.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AdminStudentsAbsencesController extends GetxController {
  late SharedPreferences prefs;
  Rx<StudentModel> student = StudentModel().obs;
  int id = 0;

  void fetch(id) async {
    var res =
        await Utilities.httpGet('admin/students/absences/' + id.toString());
    if (res.statusCode == 200) {
      var response = json.decode(res.body)['data'];
      StudentModel s = StudentModel.fromJson(response);
      var response2 = json.decode(res.body)['subjects'];
      for (AbsencesModel absence in s.absences) {
        if (response2.containsKey(absence.subject.name)) {
          absence.subject.absencesCount = response2[absence.subject.name];
        }
      }
      student.value = s;
    }
    update();
  }
}
