import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late SharedPreferences prefs;

  RxBool passwordVisible = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() async {
    final api = await Config.api;
    // Here you can fetch you product from server
    prefs = await SharedPreferences.getInstance();
    // Check if user is authenticated
    String jwt = await jwtOrEmpty();
    if (jwt != "") {
      var res = await http.post(Uri.parse("$api/auth/refresh"),
          headers: {"Authorization": jwt});
      try {
        if (res.statusCode == 200) {
          String jwt = 'Bearer ' + json.decode(res.body)['access_token'];
          await prefs.setString('jwt', jwt);
          redirect(await Utilities.getUser);
          return;
        }
      } on FormatException catch (e) {
        print('JWT Error!');
      }
    }
    super.onInit();
  }

  void logout() async {
    final api = await Config.api;
    // Here you can fetch you product from server
    prefs = await SharedPreferences.getInstance();
    // Check if user is authenticated
    String jwt = await jwtOrEmpty();
    if (jwt != "") {
      var res = await http.post(Uri.parse("$api/auth/refresh"),
          headers: {"Authorization": jwt});
      try {
        if (res.statusCode == 200) {
          await prefs.setString('jwt', '');
          redirect(await Utilities.getUser);
          return;
        }
      } on FormatException catch (e) {
        print('JWT Error!');
      }
    }
    super.onInit();
  }

  Future jwtOrEmpty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');
    if (jwt == null) return "";
    return jwt;
  }

  Future login() async {
    // GET JWT
    final api = await Config.api;
    var res = await http.post(Uri.parse("$api/auth/login"),
        body: {"email": email.text, "password": password.text});
    if (res.statusCode == 200) {
      String jwt = 'Bearer ' + json.decode(res.body)['access_token'];
      await prefs.setString('jwt', jwt);

      // Set User Details
      UserModel user = await setUserDetails(jwt) as UserModel;
      redirect(user);
    } else {
      // Show error dialog
      Get.snackbar("Error", "Wrong Username or Password");
    }
  }

  Future setUserDetails(String jwt) async {
    final api = await Config.api;
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

  void redirect(UserModel user) async {
    switch (user.type) {
      case 1:
        Get.offAllNamed(Routes.adminMain);
        break;
      case 2:
        Get.offAllNamed(Routes.teacherMain);
        break;
      case 3:
        Get.offAllNamed(Routes.adminMain);
        break;
      default:
    }
  }
}
