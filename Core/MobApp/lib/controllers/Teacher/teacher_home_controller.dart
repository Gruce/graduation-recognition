import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/models/schedule/lectures.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TeacherHomeController extends GetxController {
  RxBool showns = false.obs;
  RxBool isLectureStarted = false.obs;
  RxList lectures = <LecturesModle>[].obs;

  var listsearch = [];
  late SharedPreferences prefs;

  final api = Config.api;

  @override
  void onInit() async {
    fetch();
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

  void fetch() async {
    var res = await Utilities.httpGet('teacher/lectures');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'][0]['lectures'];

      for (var element in response) {
        lectures.add(LecturesModle.fromJson(element));
        
      }
    }
    update();
  }

  void startLecture() {
    isLectureStarted.value = !isLectureStarted.value;
  }
}
