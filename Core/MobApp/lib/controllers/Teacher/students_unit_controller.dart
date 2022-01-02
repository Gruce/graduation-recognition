import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/student_models/student.dart';

import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherStudentsUnitController extends GetxController {
  RxList students = <StudentModel>[].obs;
  RxList filteredStudent = <StudentModel>[].obs;
  late SharedPreferences prefs;
  final api = Config.api;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    filteredStudent.assignAll(students);
    super.dispose();
  }

  void fetch(id) async {
    students.clear();
    var res = await Utilities.httpGet('teacher/unit/' + id.toString());
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'][0]['units'][0]['students'];
      for (var element in response) {
        students.add(StudentModel.fromJson(element));
      }
    }
    filteredStudent.assignAll(students);

    update();
  }

  void search(text) {
    
    if (text.isEmpty) {
      filteredStudent.assignAll(students);
    } else {
      
      filteredStudent.assignAll(students
          .where((student) =>
              student.user.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    
    }
    update();
  }
}
