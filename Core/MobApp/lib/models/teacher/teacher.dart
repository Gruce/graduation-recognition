// ignore_for_file: non_constant_identifier_names
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';

import '../user.dart';

class TeacherModel {
  int id = 0;
  int user_id = 0;
  int section_id = 0;
  int stage_id = 0;
  String speciality = '';
  UserModel user = UserModel();
  SectionModel section = SectionModel();
  StageModel stage = StageModel();
  

  TeacherModel({
    id,
    user_id,
    section_id,
    stage_id,
    unit_id,
    speciality,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    section_id = json['section_id'];
    stage_id = json['stage_id'];
    speciality = json['speciality'];
    if (json.containsKey('user')) {
      
      user = UserModel.fromJson(json['user']);
    } else {
     
    }
    if (json.containsKey('section')) {
      section = SectionModel.fromJson(json['section']);
    }
    if (json.containsKey('stage')) {
      stage = StageModel.fromJson(json['stage']);
    }
    
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['section_id'] = section_id;
    data['stage_id'] = stage_id;
    data['speciality'] = speciality;
    return data;
  }
}
