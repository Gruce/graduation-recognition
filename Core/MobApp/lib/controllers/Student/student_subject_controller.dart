import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/student/model/subjects.dart';
import 'package:graduaiton_app/util/utilities.dart';

class SubjectsStudentController extends GetxController {
  RxList subject = <SubjectsModel>[].obs;
  late int x, y;

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

  void fechStudentTask(int x, int y) async {
    var res = await Utilities.httpGet(
        'student/subject-tasks/' + x.toString() + '/' + y.toString());

    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
        
      // for (var element in response) {
      //   subject.add(SubjectsModel.fromJson(element));
      // }
    }
    update();
  }

  void fechTask(subjectId, techerId) {
    x = subjectId;
    y = techerId;
    print(x);
    print(y);
    fechStudentTask(x,y);
  }
}
