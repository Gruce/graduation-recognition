import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfileController extends GetxController {
  void onInit() async {
    // print(Get.parameters['id']);
    super.onInit();
  }

  Future<UserModel> get getUser async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = json.decode(prefs.getString('user') ?? '');
    return UserModel.fromJson(data);
  }
}
