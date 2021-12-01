import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/util/utilities.dart';

class AdminHomeController extends GetxController {
  RxList cameras = <CameraModel>[].obs;

  final api = Config.api;

  @override
  void onInit() async {
    getCameras();
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
}
