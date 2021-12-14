import 'dart:io';

class NotificationModel {
  int id = 0;
  String title = '';
  String body = '';
  int to = 0;
  List<int> ids = [];
  List files = [];

  NotificationModel({id, title, body, to, ids, files});

  NotificationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    to = json['to'];
    ids = json['ids'];
    files = json['files'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['to'] = to;
    data['ids'] = ids;
    data['files'] = files;
    return data;
  }
}
