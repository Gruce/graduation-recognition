// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import '../admin_students_controller.dart';
import 'admin_stages_controller.dart';
import 'admin_units_controller.dart';

class AdminSectionsController extends GetxController {
  late SharedPreferences prefs;
  RxList sections = <SectionModel>[].obs;
  RxInt sectionSelectedIndex = 0.obs;

  AdminStudentsController studentController =
      Get.put(AdminStudentsController());
  AdminStagesController stageController = Get.put(AdminStagesController());
    AdminUnitsController unitController = Get.put(AdminUnitsController());

  final api = Config.api;

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

  void filterBySection(index) {
    sectionSelectedIndex.value = index;
    // print( sectionSelectedIndex.value);
    SectionModel section = sections[index];
    StageModel stage = stageController.stages[index];

    for (StageModel s in stageController.filteredStages) {}
    stageController.filterBySection(section.id);

    for (UnitModel u in unitController.filteredUnits) {}
    unitController.filterByStage(stage.id);

    
    stageController.update();
    unitController.update();
    studentController.update();
    update();
  }
}
