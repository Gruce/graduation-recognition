import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/student/model/subjects.dart';
import 'package:graduaiton_app/util/utilities.dart';

class SubjectsStudentController extends GetxController {
  RxList subject = <SubjectsModel>[].obs;
  late int x;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('student/subjects');

    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      print(response);
      for (var element in response) {
        subject.add(SubjectsModel.fromJson(element));
      }
    }
    update();
  }

  void d(id) {
    x = id;
    print(x);
  }
}
