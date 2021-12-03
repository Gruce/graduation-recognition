import 'package:graduaiton_app/models/tracking.dart';

class StudentModel {
  int id = 0;
  int userId = 0;
  int sectionId = 0;
  int stageId = 0;
  int unitId = 0;
  String name = '';
  int trainingId = 1;
  int type = 0;
  TrackingModel trackings = TrackingModel();

  StudentModel(
      {id,
      userId,
      sectionId,
      stageId,
      unitId,
      name,
      trainingId,
      type,
      trackings});

  StudentModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sectionId = json['section_id'];
    stageId = json['stage_id'];
    unitId = json['unit_id'];
    name = json['name'];
    trainingId = json['training_id'];
    type = json['type'];
    trackings = TrackingModel.fromJson(json['trackings'][0]);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['section_id'] = sectionId;
    data['stage_id'] = stageId;
    data['unit_id'] = unitId;
    data['name'] = name;
    data['training_id'] = trainingId;
    data['type'] = type;
    data['trackings'] = trackings;
    return data;
  }
}
