import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_absences_controller.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonProfileController extends GetxController {
  StudentModel student = StudentModel();
  RxString imageURL = ''.obs;
  AdminStudentsAbsencesController absenceController = AdminStudentsAbsencesController();

  void onInit() async {
    super.onInit();
  }

  void getUser(int id) async {
    var res = await Utilities.httpGet("admin/students/" + id.toString());
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body)['data'];
      student = StudentModel.fromJson(data);
      // imageURL.value = jsonDecode(res.body)['image'];
    }
    update();
  }

  void getStudentId(int id){
      absenceController.getStudentId(id);
  }
}
