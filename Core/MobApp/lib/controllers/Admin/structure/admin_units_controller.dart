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

class AdminUnitsController extends GetxController {
  late SharedPreferences prefs;
  RxList units = <StageModel>[].obs;
  RxInt unitSelectedIndex = 0.obs;

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
      units.add(UnitModel.fromJson({"id": -1, "name": "All Units"}));
      for (var element in response) {
        units.add(UnitModel.fromJson(element));
        print(element);
      }
    }
    update();
  }

  void filterByUnit(index) {
    unitSelectedIndex.value = index;
    UnitModel unit = units[index];

    if (unit.id == -1) {
      studentController.filteredStudents.assignAll(studentController.students);
    } else {
      studentController.filteredStudents.assignAll(studentController.students
          .where((student) => student.unit_id == unit.id));
    }

    studentController.update();

    update();
  }
}
