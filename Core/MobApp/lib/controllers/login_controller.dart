import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/main.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final api = dotenv.env['API'];
  late SharedPreferences prefs;

  RxBool passwordVisible = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() async {
    // Here you can fetch you product from server
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  Future login() async {
    // GET JWT
    var res = await http.post(Uri.parse("$api/auth/login"),
        body: {"email": email.text, "password": password.text});
    if (res.statusCode == 200) {
      String jwt = 'Bearer ' + json.decode(res.body)['access_token'];
      await prefs.setString('jwt', jwt);

      // Set User Details
      UserModel user = await setUserDetails(jwt) as UserModel;
      switch (user.type) {
        case 'admin':
          Get.offAllNamed(Routes.adminHome);
          break;
        case 'teacher':
          Get.offAllNamed(Routes.adminHome);
          break;
        case 'student':
          Get.offAllNamed(Routes.adminHome);
          break;
        default:
      }
    } else {
      // Show error dialog
      Get.snackbar("Error", "Wrong Username or Password");
    }
  }

  Future setUserDetails(String jwt) async {
    var res = await http
        .post(Uri.parse("$api/auth/me"), headers: {"Authorization": jwt});
    if (res.statusCode == 200) {
      Map data = json.decode(res.body);
      UserModel user = UserModel.fromJson(data);
      await prefs.setString('user', json.encode(user));
      return user;
    }
    return Null;
  }
}
