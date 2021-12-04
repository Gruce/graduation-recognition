// ignore_for_file: non_constant_identifier_names
class StageModel {
  int id = 0;
  String name = '';
  int section_id = 0;

  StageModel({id, name, section_id});

  StageModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    section_id = json['section_id'];
    // if (!json['trackings'].isEmpty) {
    //   trackings = TrackingModel.fromJson(json['trackings'][0]);
    // }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['section_id'] = section_id;
    return data;
  }
}
