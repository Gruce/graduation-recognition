import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/util/utilities.dart';

class TeacherUnitsController extends GetxController {
  RxList units = <UnitModel>[].obs;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  void fetch() async {
    var res = await Utilities.httpGet('teacher/units');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'][0]['units'];
      for (var element in response) {
        units.add(UnitModel.fromJson(element));
       
      }
    }
    update();
  }
}
