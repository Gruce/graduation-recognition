import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_sections_controller.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_stages_controller.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_units_controller.dart';
import 'package:graduaiton_app/models/schedule/lecture.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/screens/general/luctures/lucture_search_widget.dart';

import 'lecture_days_filter_widget.dart';
import 'lecture_dropdown_widget.dart';

class Property {
  String name;
  bool value;
  Icon icon;
  Widget widget;
  Property(
      {required this.name,
      required this.value,
      required this.icon,
      required this.widget});
}

class LucturesController extends GetxController {
  List<LectureModel> lectures = <LectureModel>[];
  List<LectureModel> filteredLectures = <LectureModel>[];
  List<Property> properties = <Property>[].obs;
  RxString textSearch = "".obs;
  RxInt sectionIndex = (-1).obs;
  RxInt stageIndex = (-1).obs;
  RxInt unitIndex = (-1).obs;

  // List<LectureModel> filteredStages = <LectureModel>[];
  // RxList stages = <StageModel>[].obs;
  // RxInt stageSelectedIndex = 0.obs;

  void oneTime() {
    properties.assignAll([
      Property(
        name: 'search',
        value: false,
        icon: const Icon(Icons.search),
        widget: LuctureSearchWidget(controller: this),
      ),
      Property(
        name: 'stage',
        value: false,
        icon: const Icon(Icons.storage),
        widget: LuctureDropDownWidget(controller1: this),
      ),
      Property(
        name: 'unit',
        value: false,
        icon: const Icon(Icons.ac_unit),
        widget: LuctureSearchWidget(controller: this),
      ),
      Property(
        name: 'days',
        value: false,
        icon: const Icon(Icons.date_range),
        widget: LuctureDaysFilterWidget(controller2: this),
      ),
    ]);

    filteredLectures.assignAll(lectures);
  }


  void filter() {
      
    // LecturesSectionsController _sectionController = Get.put(LecturesSectionsController());
    // LecturesStagesController _stageController = Get.put(LecturesStagesController());
    // LecturesUnitsController _unitController = Get.put(LecturesUnitsController());

    filteredLectures.assignAll(lectures);

    // Search Filter
    if (textSearch.value.isNotEmpty) {
      filteredLectures.assignAll(lectures
          .where((lecture) => lecture.teacher.user.name
              .toLowerCase()
              .contains(textSearch.value.toLowerCase()))
          .toList());
    }

    // Another Filter
    // _sectionController.filterBySection(sectionIndex);
    // _stageController.filterByStage(stageIndex);
    // _unitController.filterByUnit(unitIndex);
    
    update();
  }

  void toggleProperty(Property p) {
    int i = properties.indexOf(p);
    properties[i].value = !properties[i].value;
    update();
  }

  // void filterByStage(index) {
  //   stageSelectedIndex.value = index;
  //   LectureModel stage = filteredStages[index];
  //   print(filteredStages);

  //   if (stage.id == -1) {
  //     filteredLectures.assignAll(lectures);
  //   } else {
  //     filteredLectures.assignAll(lectures
  //         .where((lecture) => lecture.unit.stage_id == stage.id));
  //   }
  //   update();
  // }
}
