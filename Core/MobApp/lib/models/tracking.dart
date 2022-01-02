import 'package:jiffy/jiffy.dart';
import 'camera.dart';

class TrackingModel {
  int id = 0;
  int camera_id = 0;
  String created_at = '';
  CameraModel camera = CameraModel();

  TrackingModel({id, camera_id, person_id, seen, camera});

  TrackingModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    camera_id = json['camera_id'];
    created_at = Jiffy(json['created_at']).fromNow();
    if (!json['camera'].isEmpty) {
      camera = CameraModel.fromJson(json['camera']);
    }
    // if (json.containsKey('camera')) {
    //   for (var camera in json['camera']) {
    //     camera.add(CameraModel.fromJson(camera));
    //   }
    // }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['camera_id'] = camera_id;
    data['created_at'] = created_at;
    data['camera'] = camera;
    return data;
  }
}
