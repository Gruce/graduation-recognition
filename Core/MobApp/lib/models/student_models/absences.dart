// ignore_for_file: non_constant_identifier_names
import 'package:graduaiton_app/models/schedule/subject.dart';

class AbsencesModel {
  int id = 0;
  int lecture_id = 0;
  int subject_id = 0;
  int student_id = 0;
  String created_at='';
  SubjectModel subject = SubjectModel();
  

  AbsencesModel({
    id,
    lecture_id,
    subject_id,
    student_id,
    created_at,
    subject,
  });

  AbsencesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lecture_id = json['lecture_id'];
   
    if (json.containsKey('student_id')) {
      student_id = json['student_id'];
    }
    if (json.containsKey('created_at')) {
      created_at = json['created_at'];
    }
    if (json.containsKey('subject')) {
      subject = SubjectModel.fromJson(json['subject']);
    }
    
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['lecture_id'] = lecture_id;
    data['student_id'] = student_id;
    data['created_at'] = created_at;
    data['subject'] = subject;
    return data;
  }
}
