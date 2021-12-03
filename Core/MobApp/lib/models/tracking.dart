// ignore_for_file: non_constant_identifier_names

import 'package:jiffy/jiffy.dart';
import 'camera.dart';

class TrackingModel {
  int id = 0;
  // ignore: non_constant_identifier_names
  int camera_id = 0;
  // ignore: non_constant_identifier_names
  int person_id = 0;
  String seen = '';
  CameraModel camera = CameraModel();

  TrackingModel({id, camera_id, person_id, seen, camera});

  TrackingModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    camera_id = json['camera_id'];
    person_id = json['person_id'];
    seen = Jiffy(json['seen']).fromNow();
    if (!json['camera'].isEmpty) {
      camera = CameraModel.fromJson(json['camera']);
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['camera_id'] = camera_id;
    data['person_id'] = person_id;
    data['seen'] = seen;
    data['camera'] = camera;
    return data;
  }
}
