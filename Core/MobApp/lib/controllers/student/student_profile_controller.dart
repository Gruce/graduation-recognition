import 'package:get/get.dart';
import 'package:graduaiton_app/util/utilities.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StudentProfileController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
  }

  void fetch() async {
    final res = await Utilities.httpGet('student/info');
    print('11111111111111111111111111');
    if (res.statusCode == 200) {
      student.value = StudentModel.fromJson(json.decode(res.body)['data']);
      print('====================6========================');
      print(student.value.absences[2].subject.name);
      print('==================6==========================');
    }
    update();
  }
}
