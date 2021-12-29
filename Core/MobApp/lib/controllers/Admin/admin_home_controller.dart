import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:intl/intl.dart';

class AdminHomeController extends GetxController {
  RxList cameras = <CameraModel>[].obs;
  RxBool shown = false.obs;
  RxList lectures = <LectureModel>[].obs;

  @override
  void onInit() async {
    getCameras();
    fetch();

    super.onInit();
  }

  void getCameras() async {
    var res = await Utilities.httpGet('cameras');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        cameras.add(CameraModel.fromJson(element));
      }
    }
    update();
  }

  void fetch() async {
    var res = await Utilities.httpGet('lectures/' + DateFormat('EEEE').format(DateTime.now()));
    print(DateFormat('EEEE').format(DateTime.now()));
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        lectures.add(LectureModel.fromJson(element));
      }
    }
  }

  void swipe(details){

    // print(details);
  }
}
