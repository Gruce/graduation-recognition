// ignore_for_file: non_constant_identifier_names
import 'package:graduaiton_app/models/student_models/absences.dart';
import '../user.dart';
import 'stage.dart';
import 'unit.dart';

class StudentModel {
  int id = 0;
  int user_id = 0;
  int section_id = 0;
  int stage_id = 0;
  int unit_id = 0;
  int type = 0;
  UserModel user = UserModel();
  SectionModel section = SectionModel();
  StageModel stage = StageModel();
  UnitModel unit = UnitModel();
  List<AbsencesModel> absences = [];

  StudentModel({
    id,
    user_id,
    section_id,
    stage_id,
    unit_id,
    type,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    section_id = json['section_id'];
    stage_id = json['stage_id'];
    unit_id = json['unit_id'];
    type = json['type'];
    if (json.containsKey('section_id')) {
      section_id = json['section_id'];
    }
    if (json.containsKey('stage_id')) {
      stage_id = json['stage_id'];
    }
    if (json.containsKey('unit_id')) {
      unit_id = json['unit_id'];
    }
    if (json.containsKey('user')) {
      user = UserModel.fromJson(json['user']);
    }
    if (json.containsKey('section')) {
      section = SectionModel.fromJson(json['section']);
    }
    if (json.containsKey('stage')) {
      stage = StageModel.fromJson(json['stage']);
    }
    if (json.containsKey('unit')) {
      unit = UnitModel.fromJson(json['unit']);
    }
    if (json.containsKey('absences')) {
      for(var absence in json['absences']){
        absences.add(AbsencesModel.fromJson(absence));
      }
     for (var file in json['files']) {
      absences.add(AbsencesModel.fromJson(file));
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['section_id'] = section_id;
    data['stage_id'] = stage_id;
    data['unit_id'] = unit_id;
    data['type'] = type;
    return data;
  }
}
