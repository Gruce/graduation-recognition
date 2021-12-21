import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AdminProfileController extends GetxController {
  late SharedPreferences prefs;

  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() async {
    user.value = await Utilities.getUser;
    super.onInit();
  }



}
