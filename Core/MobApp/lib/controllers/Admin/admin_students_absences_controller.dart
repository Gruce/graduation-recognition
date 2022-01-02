import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/absences.dart';
import 'package:graduaiton_app/models/schedule/subject.dart';
import 'package:graduaiton_app/models/student_models/student.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AdminStudentsAbsencesController extends GetxController {
  late SharedPreferences prefs;
  StudentModel student = StudentModel();
  SubjectModel subject = SubjectModel();
  // RxList subjects = [].obs;
  RxBool loaded = true.obs;
  int id = 0;
  int userId = -1;
  @override
  void onInit() async {
    fetch(id);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetch(id) async {
    var res = await Utilities.httpGet('admin/students/absences/'+ id.toString());
    if (res.statusCode == 200) {
      // print(res.body);
      var response = json.decode(res.body)['data'];
      student = StudentModel.fromJson(response);
      var response2 = json.decode(res.body)['subjects'];
      // print(response2['DATA WHEREHOUSE']);
      for(AbsencesModel absence in student.absences){
         if (response2.containsKey(absence.subject.name)){
           absence.subject.absencesCount = response2[absence.subject.name];
         }
      }
    }
    loaded.value = true ;
    update();
  }

  void getStudentId(int id){
    fetch(id);
  }

}
