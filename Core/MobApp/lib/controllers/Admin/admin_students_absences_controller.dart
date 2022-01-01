import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AdminStudentsAbsencesController extends GetxController {
  late SharedPreferences prefs;
  RxList students = <StudentModel>[].obs;
  RxInt id = 0.obs;
  @override
  void onInit() async {
    fetch(id);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetch(id) async {
    var res = await Utilities.httpGet('admin/students/absences/'+ id.toString());
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        students.add(StudentModel.fromJson(element));
      }
    }
  }

  void getStudentId(int id){
    fetch(id);
  }

}
