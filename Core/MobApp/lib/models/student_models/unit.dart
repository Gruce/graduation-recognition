// ignore_for_file: non_constant_identifier_names

class UnitModel {
  int id = 0;
  String name = '';
  int stage_id = 0;
  int section_id = 0;

  UnitModel({id, name, stage_id, section_id});

  UnitModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stage_id = json['stage_id'];
    section_id = json['section_id'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['stage_id'] = stage_id;
    data['section_id'] = section_id;
    return data;
  }
}
