import 'package:graduaiton_app/models/user.dart';

import 'tracking.dart';

class PersonModel {
  int id = 0;
  String name = '';
  int trainingId = 1;
  int type = 0;
  String typeString = '';
  UserModel user = UserModel();
  TrackingModel trackings = TrackingModel();

  PersonModel({id, name, trainingId, type, trackings, imageURL});

  PersonModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    trainingId = json['training_id'];
    type = json['type'];
    typeString = getTypeString(type);
    if(json.containsKey('user')){
      user = UserModel.fromJson(json['user']);
    }
    if (!json['trackings'].isEmpty) {
      trackings = TrackingModel.fromJson(json['trackings'][0]);
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['training_id'] = trainingId;
    data['type'] = type;
    data['trackings'] = trackings;
    return data;
  }

  String getTypeString(int type){
    switch (type){
      case 0:
        return "Visitor";
      case 1:
        return "Student";
      case 2:
        return "Employer";
    }
    return "Unknown";
  }
}
