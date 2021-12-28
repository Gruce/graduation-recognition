// ignore_for_file: non_constant_identifier_names

class SectionModel {
  int id = 0;
  String name = '';

  SectionModel({id, name});

  SectionModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<dynamic, dynamic> toJson(section) {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
