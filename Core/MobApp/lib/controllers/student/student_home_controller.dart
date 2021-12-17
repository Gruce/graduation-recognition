import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentHomeController extends GetxController {
  RxBool isLectureStarted = false.obs;

  var listsearch = [];
  late SharedPreferences prefs;

  final api = Config.api;

  @override
  void onInit() async {
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

  // void startLecture(){
  //   isLectureStarted.value = !isLectureStarted.value;
  // }
}
