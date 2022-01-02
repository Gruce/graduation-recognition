import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfileController extends GetxController {
  Rx<TeacherModel> teacher = TeacherModel().obs;
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
    final res = await Utilities.httpGet('teacher/info');
    if (res.statusCode == 200) {
      teacher.value = TeacherModel.fromJson(json.decode(res.body)['data'][0]);
      // print(teacher.value.user.type);
    }
    update();
  }
}
