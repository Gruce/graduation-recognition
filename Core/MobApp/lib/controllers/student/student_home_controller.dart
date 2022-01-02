import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentHomeController extends GetxController {
  RxList currentLectures = <LectureModel>[].obs;
  RxBool showns = false.obs;
  var listsearch = [];
  late SharedPreferences prefs;

  final api = Config.api;
  late TextEditingController codeController;
  @override
  void onInit() async {
    codeController = TextEditingController();
    fetchCurrentLectures();
    prefs = await SharedPreferences.getInstance();
    getData();
    super.onInit();
  }

  Future getData() async {
    String jwt = prefs.getString('jwt').toString();
    var res = await http
        .get(Uri.parse("$api/people"), headers: {"Authorization": jwt});
    if (res.statusCode == 200) {
      var responsebody = jsonDecode(res.body)['data'];
      for (int i = 0; i < responsebody.length; i++) {
        listsearch.add(responsebody[i]);
      }
    }
  }

  void fetchCurrentLectures() async {
    var res = await Utilities.httpGet('student/current-lecture');
    if (res.statusCode == 200) {
      var response = json.decode(res.body)['data'];

      currentLectures.add(LectureModel.fromJson(response));
      print(currentLectures[0].id);
      print('===============================================================');
    }

    update();
  }

  void changeUnit() async {
    var res = await Utilities.httpPost(
        'student/change-unit/', {'code': codeController.text});

    if (res.statusCode == 200) {
      Get.snackbar('Successful', 'Done',
          backgroundColor: Colors.green[200], icon: Icon(Icons.done));
    } else {
      Get.snackbar('Erroe', "Your code does not working",
          backgroundColor: Colors.red[200], icon: Icon(Icons.close));
    }
    update();
  }
  // void startLecture(){
  //   isLectureStarted.value = !isLectureStarted.value;
  // }
}
