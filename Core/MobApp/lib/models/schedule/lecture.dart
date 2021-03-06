import 'package:graduaiton_app/models/camera.dart';
import 'package:graduaiton_app/models/schedule/classroom.dart';
import 'package:graduaiton_app/models/schedule/day.dart';
import 'package:graduaiton_app/models/schedule/subject.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/models/teacher/teacher.dart';

class LectureModel {
  int id = 0;
  int subject_id = 0;
  int teacher_id = 2;
  int unit_id = 0;
  int classroom_id = 0;
  int day_id = 0;
  String start = '';
  String end = '';
  UnitModel unit = UnitModel();
  ClassroomModel classroom = ClassroomModel();
  CameraModel cameras = CameraModel();
  SubjectModel subject = SubjectModel();
  DayModel day = DayModel();
  TeacherModel teacher = TeacherModel();

  LectureModel({
    id,
    subject_id,
    teacher_id,
    unit_id,
    classroom_id,
    day_id,
    start,
    end,
    classroom,
    cameras,
    subject,
    day,
    unit,
  });

  LectureModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    subject_id = json['subject_id'];
    teacher_id = json['teacher_id'];
    unit_id = json['unit_id'];
    classroom_id = json['classroom_id'];
    day_id = json['day_id'];

    if (json.containsKey('start')) {
      start = json['start'];
    }
    if (json.containsKey('end')) {
      end = json['end'];
    }
    if (json.containsKey('subject')) {
      subject = SubjectModel.fromJson(json['subject']);
    }

    if (json.containsKey('cameras')) {
      cameras = CameraModel.fromJson(json['cameras']);
    }
    if (json.containsKey('classroom')) {
      classroom = ClassroomModel.fromJson(json['classroom']);
    }
    if (json.containsKey('day')) {
      day = DayModel.fromJson(json['day']);
    }
    if (json.containsKey('unit')) {
      unit = UnitModel.fromJson(json['unit']);
    }
    if (json.containsKey('teacher')) {
      teacher = TeacherModel.fromJson(json['teacher']);
    }
    if (json.containsKey('day')) {
      day = DayModel.fromJson(json['day']);
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['teacher_id'] = teacher_id;
    data['subject_id'] = subject_id;
    data['unit_id'] = unit_id;
    data['classroom_id'] = classroom_id;
    data['day_id'] = day_id;
    data['start'] = start;
    data['end'] = end;
    data['classroom'] = classroom;
    data['cameras'] = cameras;
    data['subject'] = subject;
    // data['day'] = day;
    data['unit'] = unit;
    return data;
  }
}
