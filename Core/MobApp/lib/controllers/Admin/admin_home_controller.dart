import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:intl/intl.dart';

class AdminHomeController extends GetxController {
  RxList cameras = <CameraModel>[].obs;
  RxBool shown = false.obs;
  RxList lectures = <LectureModel>[].obs;
  RxList lecturers = <TeacherModel>[].obs;

  @override
  void onInit() async {
    getCameras();
    fetch();
    fetchTodaysLecturers();

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
    var res = await Utilities.httpGet(
        'lectures/' + DateFormat('EEEE').format(DateTime.now()));
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        lectures.add(LectureModel.fromJson(element));
      }
    }
  }

  void fetchTodaysLecturers() async {
    var res = await Utilities.httpGet('admin/lectures');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        TeacherModel teacher = TeacherModel.fromJson(element['teacher']);
        if (lecturers.indexWhere((element) => element.id == teacher.id) == -1) {
          lecturers.add(teacher);
        }
      }
    }
  }
}
