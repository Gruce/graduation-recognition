import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AdminStudentsController extends GetxController {
  late SharedPreferences prefs;
  RxList students = <StudentModel>[].obs;
  RxList filteredStudents = <StudentModel>[].obs;

  final api = Config.api;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  @override
  void dispose() {
    filteredStudents.assignAll(students);
    super.dispose();
  }

  void fetch() async {
    var res = await Utilities.httpGet('students');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        print(element);
        students.add(StudentModel.fromJson(element));
      }
    }
    filteredStudents.assignAll(students);
    update();
  }

  void search(text) {
    if (text.isEmpty) {
      filteredStudents.assignAll(students);
    } else {
      filteredStudents.assignAll(students
          .where((student) =>
              student.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
    update();
  }
}
