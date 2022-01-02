import 'package:graduaiton_app/models/teacher/teacher.dart';

class SubjectModel {
  int id = 0;
  String name = '';
  // List<TeacherModel> teachers = [];
  SubjectModel({id, name});

  SubjectModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];

    // for (var teacher in json['teachers']) {
    //   teachers.add(TeacherModel.fromJson(teacher));
    // }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
