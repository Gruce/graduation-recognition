import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import '../admin_students_controller.dart';
import 'admin_stages_controller.dart';

class AdminUnitsController extends GetxController {
  late SharedPreferences prefs;
  RxList units = <UnitModel>[].obs;
  RxInt unitSelectedIndex = 0.obs;
  RxList filteredUnits = <UnitModel>[].obs;
  AdminStudentsController studentController =
      Get.put(AdminStudentsController());

  final api = Config.api;

  @override
  void onInit() async {
    fetchUnits();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  void fetchUnits() async {
    var res = await Utilities.httpGet('units');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      // units.add(UnitModel.fromJson({"id": -1, "name": "All Units"}));
      for (var element in response) {
        units.add(UnitModel.fromJson(element));
      }
      filteredUnits.assignAll(units);
    }
    update();
  }

  void filterByUnit(index) {
    unitSelectedIndex.value = index;
    UnitModel unit = filteredUnits[index];
    if (unit.id == -1) {
      studentController.filteredStudents.assignAll(studentController.students);
    } else {
      studentController.filteredStudents.assignAll(studentController.students
          .where((student) => student.unit_id == unit.id));
    }
    studentController.update();
    update();
  }

  void filterByStage(id) {
    unitSelectedIndex.value = 0;
    if (id == -1) {
      filteredUnits.assignAll(units);
    } else {
      filteredUnits.assignAll(units.where((unit) => unit.stage_id == id));
    }
    filterByUnit(0);
  }
}
