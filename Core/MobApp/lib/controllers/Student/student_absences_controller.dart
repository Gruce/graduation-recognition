import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AbsencesController extends GetxController {
  late SharedPreferences prefs;
  Rx<StudentModel> student = StudentModel().obs;
  void onInit() async {
    fetch();
    super.onInit();
  }

  Future<UserModel> get getUser async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = json.decode(prefs.getString('user') ?? '');
    return UserModel.fromJson(data);
  }

  void fetch() async {
    final res = await Utilities.httpGet('student/info');
    print('11111111111111111111111111');
     if (res.statusCode == 200) {
     student.value = StudentModel.fromJson(json.decode(res.body)['data']);
    print('====================6========================');
    print(student.value.absences[2].subject.name);
    print('==================6==========================');
     }
    update();
  }
}
