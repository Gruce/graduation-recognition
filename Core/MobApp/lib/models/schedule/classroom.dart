import 'package:graduaiton_app/models/camera.dart';

class ClassroomModel {
  int id = 0;
  String name = '';
  List<CameraModel> cameras = [];

  ClassroomModel({id, name,cameras});

  ClassroomModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    for (var camera in json['cameras']) {
      cameras.add(CameraModel.fromJson(camera));
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cameras'] = cameras;
    return data;
  }
}
