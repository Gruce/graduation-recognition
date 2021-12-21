import 'package:flutter/src/widgets/framework.dart';

class CameraModel {
  int id = 0;
  String description = '';
  int classroom_id = 0;
  int state = 1;
  String source = '0';

  CameraModel({id, name, trainingId, type, description});

  CameraModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    description = json['description'];
    state = json['state'];
    source = json['source'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['state'] = state;
    data['source'] = source;
    return data;
  }
}
