import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/util/utilities.dart';

class AdminNotificationController extends GetxController {
  RxBool allTeachersCheckbox = false.obs;
  RxBool allStudentsCheckbox = false.obs;

  RxList sections = <SectionModel>[].obs;
  List stagesCheckBoxes = [];

  // @override
  @override
  void onInit() async {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    toController = TextEditingController();
    idsController = TextEditingController();

    fetch();
    fetchSections();
    super.onInit();
  }

  late TextEditingController titleController,
      bodyController,
      toController,
      idsController;
  List files_path = [].obs;
  RxList files = [].obs;
  String title = '';
  String body = '';
  int to = 1;
  RxList lectures = <LectureModel>[].obs;
  RxMap lucturerCheckbox = {}.obs;

  void fetch() async {
    var res = await Utilities.httpGet('admin/lectures');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        lectures.add(LectureModel.fromJson(element));
      }
    }
  }

  void fetchSections() async {
    var res = await Utilities.httpGet('admin/sections/');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        sections.add(SectionModel.fromJson(element));
      }
    }
    update();
  }

  void pick_files() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      files_path = result.paths.map((path) => path!).toList();
      files.assignAll(result.files);
    } else {
      // User canceled the picker
    }
    update();
  }

  void send_notification() async {
    List _teachers = [];

    lucturerCheckbox.forEach((key, value) {
      if (value == true) {
        _teachers.add(lectures[key].id);
      }
    });
    await Utilities.httpFilesPost(
        'teacher/send-task',
        {
          'title': titleController.text,
          'body': bodyController.text,
          'to': '1',
          'ids': _teachers.toString(),
        },
        files_path);
    files.clear();
    files_path.clear();
    titleController.text = '';
    bodyController.text = '';

    Get.off(AdminNotificationController());
  }

  void removeIndex(i) {
    files.removeAt(i);
    files_path.removeAt(i);
    update();
  }

  void check(key, value) {
    lucturerCheckbox[key] = value!;
  }

  void changeSectionVisibility(SectionModel section) {
    section.visibility = !section.visibility;
    update();
  }

  void stagesCheckBoxeToggle(StageModel stage) {}
}
