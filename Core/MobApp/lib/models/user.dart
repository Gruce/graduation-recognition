import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/models/tracking.dart';

class UserModel {
  int id = 0;
  String name = '';
  String email = '';
  int type = 0;
  String typeString = '';
  List<TrackingModel> trackings = [];

  UserModel({id, name, email, type});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json.containsKey('email')) {
      email = json['email'];
    }
    if (json.containsKey('type')) {
      type = json['type'];
    }
    typeString = getTypeString(type);

    if (json.containsKey('trackings')) {
      for (var tracking in json['trackings']) {
        trackings.add(TrackingModel.fromJson(tracking));
      }
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['type'] = type;
    // data['trackings'] = trackings;

    return data;
  }

  String getTypeString(int type) {
    switch (type) {
      case 1:
        return "Admin";
      case 2:
        return "Lecturer";
      case 3:
        return "Student";
    }
    return "Unknown";
  }
}
