import 'package:graduaiton_app/models/teacher/files.dart';
import 'package:jiffy/jiffy.dart';

class Notif {
  int id = 0;
  int teacher_id = 0;
  int to = 0;
  String title = '';
  String body = '';
  String created_at = '';
  List<FileModel> files = [];
  Notif({id, teacher_id, to, title, body, created_at, files});

  Notif.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    teacher_id = json['teacher_id'];
    to = json['to'];
    title = json['title'];
    body = json['body'];
    created_at = Jiffy(json['created_at']).fromNow();
     for (var file in json['files']) {
      files.add(FileModel.fromJson(file));
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['teacher_id'] = teacher_id;
    data['to'] = to;
    data['title'] = title;
    data['body'] = body;
    data['created_at'] = created_at;
    data['files'] = files;
    return data;
  }
}
