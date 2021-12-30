// ignore_for_file: non_constant_identifier_names

import 'package:graduaiton_app/models/student_models/stage.dart';

class SectionModel {
  int id = 0;
  String name = '';
  List<StageModel> stages = [];

  SectionModel({id, name});

  SectionModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];

    if (json.containsKey('stages')) {
      for (var stage in json['stages']) {
        stages.add(StageModel.fromJson(stage));
      }
    }
  }

  Map<dynamic, dynamic> toJson(section) {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
