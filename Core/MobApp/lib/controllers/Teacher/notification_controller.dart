import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/screens/teacher/notification/notification_screen.dart';
import 'package:graduaiton_app/util/utilities.dart';

class NotificationController extends GetxController {
  // @override
  @override
  void onInit() async {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    toController = TextEditingController();
    idsController = TextEditingController();

    fetchUnits();

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
  String deadline = '';
  int to = 1;
  List<int> ids = [15];

  RxList units = <UnitModel>[].obs;

  RxMap unitsCheckbox = {}.obs;

  void fetchUnits() async {
    var res = await Utilities.httpGet('teacher/units');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'][0]['units'];
      for (int i = 0; i < response.length; i++) {
        UnitModel unit = UnitModel.fromJson(response[i]);
        units.add(unit);
        unitsCheckbox[i] = false;
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
    List _units = [];

    unitsCheckbox.forEach((key, value) {
      if (value == true) {
        _units.add(units[key].id);
      }
    });

    Utilities.httpFilesPost(
        'teacher/send-task',
        {
          'title': titleController.text,
          'body': bodyController.text,
          'to': '1',
          'ids': _units.toString(),
          'deadline':'2021-12-15T23:24',
          
        },
        files_path);
    files.clear();
    files_path.clear();
    titleController.text = '';
    bodyController.text = '';

    Get.off(TeacherNotification());
  }

  void removeIndex(i) {
    files.removeAt(i);
    files_path.removeAt(i);
    update();
  }

  void check(key, value) {
    unitsCheckbox[key] = value!;
  }
}
