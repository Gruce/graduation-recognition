// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import 'lectures_stages_controller.dart';
import 'lectures_units_controller.dart';

class LecturesSectionsController extends GetxController {
  late SharedPreferences prefs;
  RxList sections = <SectionModel>[].obs;
  RxInt sectionSelectedIndex = 0.obs;

  LecturesStagesController stageController = Get.put(LecturesStagesController());
  LecturesUnitsController unitController = Get.put(LecturesUnitsController());
  LucturesController lucturesController = Get.put(LucturesController());

  @override
  void onInit() async {
    fetchSections();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  void fetchSections() async {
    var res = await Utilities.httpGet('sections');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      sections.add(SectionModel.fromJson({"id": -1, "name": "All Sections"}));
      for (var element in response) {
        sections.add(SectionModel.fromJson(element));
      }
    }
    update();
  }

  void filterBySection(i) {
    sectionSelectedIndex.value = i;
    SectionModel section = sections[i];

    stageController.filterBySection(section.id);
    StageModel stage = stageController.filteredStages[0];

    unitController.filterByStage(stage.id);

    stageController.update();
    unitController.update();
    lucturesController.update();
    update();
  }
}
