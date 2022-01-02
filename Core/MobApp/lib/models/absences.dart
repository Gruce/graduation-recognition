// ignore_for_file: non_constant_identifier_names

import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/models/schedule/classroom.dart';
import 'package:graduaiton_app/models/schedule/day.dart';
import 'package:graduaiton_app/models/schedule/subject.dart';
import 'package:graduaiton_app/models/student_models/section.dart';
import 'package:graduaiton_app/models/student_models/stage.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';

class AbsencesModel {
  int id = 0;
  int lecture_id = 0;
  int subject_id = 0;
  int student_id = 0;
  SubjectModel subject = SubjectModel();
  String created_at = "";
  // DayModel day = DayModel();

  AbsencesModel({
    id,
    lecture_id,
    subject_id,
    student_id,
    subject,
  });

  AbsencesModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    lecture_id = json['lecture_id'];
    subject_id = json['subject_id'];
    student_id = json['student_id'];

    if (json.containsKey('subject')) {
      subject = SubjectModel.fromJson(json['subject']);
    }

    if (json.containsKey('created_at')) {
      created_at = json['created_at'];
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};

    data['id'] = id;
    data['lecture_id'] = lecture_id;
    data['subject_id'] = subject_id;
    data['student_id'] = student_id;
    data['subject'] = subject;
    return data;
  }
}
