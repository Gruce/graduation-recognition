import 'package:graduaiton_app/models/tracking.dart';

class UserModel {
  int id = 0;
  String name = '';
  String email = '';
  int type = 0;
  String typeString = '';
  // TrackingModel trackings = TrackingModel();

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
                                                  
    // if (!json['trackings'].isEmpty) {                         
    //   trackings = TrackingModel.fromJson(json['trackings'][0]);
    // }
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
