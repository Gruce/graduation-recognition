import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AdminLucurersController extends GetxController {
  late SharedPreferences prefs;
  RxList teachers = <TeacherModel>[].obs;
  RxList filteredTeachers = <TeacherModel>[].obs;
  UserModel user = UserModel();
  SectionModel section = SectionModel();
  RxBool searchToggle = false.obs;
  RxBool filterToggle = false.obs;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  @override
  void dispose() {
    filteredTeachers.assignAll(teachers);
    super.dispose();
  }

  void fetch() async {
    var res = await Utilities.httpGet('admin/teachers');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        teachers.add(TeacherModel.fromJson(element));
      }
    }
    filteredTeachers.assignAll(teachers);
    update();
  }

  void search(text) {
    if (text.isEmpty) {
      filteredTeachers.assignAll(teachers);
    } else {
      filteredTeachers.assignAll(teachers
          .where((teacher) =>
          teacher.user.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
    update();
  }
}
