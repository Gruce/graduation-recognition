import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'lectures_stages_controller.dart';

class LecturesUnitsController extends GetxController {
  late SharedPreferences prefs;
  RxList units = <UnitModel>[].obs;
  RxInt unitSelectedIndex = 0.obs;
  RxList filteredUnits = <UnitModel>[].obs;
 
  LucturesController lucturesController = Get.put(LucturesController());


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
      }
      filteredUnits.assignAll(units);
      lucturesController.update();
    }
    update();
  }

  void filterByUnit(index) {
    unitSelectedIndex.value = index;
    UnitModel unit = filteredUnits[index];
    print(lucturesController.filteredLectures[0].unit_id);

    if (unit.id == -1) {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures);
    } else {
      lucturesController.filteredLectures.assignAll(lucturesController.lectures
          .where((lecture) => lecture.unit_id == unit.id));
    }
    lucturesController.update();
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
    update();
  }
}
