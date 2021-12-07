// ignore_for_file: non_constant_identifier_names

import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';

class UnitModel {
  int id = 0;
  String name = '';
  int stage_id = 0;
  int section_id = 0;
  int students_count = 1;
  SectionModel section = SectionModel();
  StageModel stage = StageModel();

  UnitModel({id, name, stage_id, section_id, SectionModel, StageModel});

  UnitModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stage_id = json['stage_id'];
    section_id = json['section_id'];
    students_count = json['students_count'];

    if (!json['section'].isEmpty) {
      section = SectionModel.fromJson(json['section']);
    }

    if (!json['stage'].isEmpty) {
      stage = StageModel.fromJson(json['stage']);
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['stage_id'] = stage_id;
    data['section_id'] = section_id;
    data['students_count'] = students_count;
    return data;
  }
}
