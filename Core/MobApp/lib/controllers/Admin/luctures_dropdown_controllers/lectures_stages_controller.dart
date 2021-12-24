import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import '../admin_students_controller.dart';
import 'lectures_units_controller.dart';

class LecturesStagesController extends GetxController {
  late SharedPreferences prefs;
  RxList stages = <StageModel>[].obs;
  RxList filteredStages = <StageModel>[].obs;
  RxInt stageSelectedIndex = 0.obs;

  LecturesUnitsController unitController = Get.put(LecturesUnitsController());
  LucturesController lucturesController = Get.put(LucturesController());

  @override
  void onInit() async {
    fetchStages();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  void fetchStages() async {
    var res = await Utilities.httpGet('stages');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      stages.add(StageModel.fromJson({"id": -1, "name": "All Stages"}));
      for (var element in response) {
        stages.add(StageModel.fromJson(element));
      }
      filteredStages.assignAll(stages);
    }
    update();
  }

  void filterByStage(index) {
    stageSelectedIndex.value = index;
    StageModel stage = filteredStages[index];

    unitController.filterByStage(stage.id);
    if (stage.id == -1) {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures);
    } else {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures
          .where((lecture) => lecture.unit.stage_id == stage.id));
    }

    unitController.update();
    lucturesController.update();
    update();
  }

  void filterBySection(id) {
    stageSelectedIndex.value = 0;
    if (id == -1) {
      filteredStages.assignAll(stages);
    } else {
      filteredStages.assignAll(stages.where((stage) => stage.section_id == id));
    }
    filterByStage(0);
    lucturesController.update();
  }
}
