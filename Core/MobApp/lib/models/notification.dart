import 'dart:io';

import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/models/teacher/files.dart';
import 'package:jiffy/jiffy.dart';

class NotificationModel {
  int id = 0;
  int teacher_id = 0;
  int to = 0;
  String title = '';
  String body = '';
  String created_at = '';
  List<UnitModel> units = [];
  List<int> ids = [];
  List<FileModel> files = [];
  
  NotificationModel(
      {id, teacher_id, title, body, to, ids, files, date, units});

  NotificationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    teacher_id = json['teacher_id'];
    to = json['to'];
    title = json['title'];
    body = json['body'];
    ids = json['ids'];
    created_at = Jiffy(json['created_at']).fromNow();
    for (var file in json['files']) {
      files.add(FileModel.fromJson(file));
    }
    for (var unit in json['units']) {
      units.add(UnitModel.fromJson(unit));
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['teacher_id'] = teacher_id;
    data['to'] = to;
    data['title'] = title;
    data['body'] = body;
    data['ids'] = ids;
    data['created_at'] = created_at;
    data['files'] = files;
    data['units'] = units;
    return data;
  }
}
