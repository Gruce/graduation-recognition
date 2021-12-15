// ignore_for_file: non_constant_identifier_names
import '../user.dart';
import 'section.dart';
import 'stage.dart';
import 'unit.dart';

class StudentModel {
  int id = 0;
  int user_id = 0;
  int section_id = 0;
  int stage_id = 0;
  int unit_id = 0;
  UserModel user = UserModel();
  SectionModel section = SectionModel();
  StageModel stage = StageModel();
  UnitModel unit = UnitModel();

  StudentModel({
    id,
    user_id,
    section_id,
    stage_id,
    unit_id,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    section_id = json['section_id'];
    stage_id = json['stage_id'];
    unit_id = json['unit_id'];
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
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['section_id'] = section_id;
    data['stage_id'] = stage_id;
    data['unit_id'] = unit_id;
    return data;
  }
}
