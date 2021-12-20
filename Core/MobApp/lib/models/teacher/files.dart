class FileModel {
  int id = 0;
  int task_id = 0;
  String file_path = '';


  FileModel({id,task_id, file_path});

  FileModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    task_id = json['task_id'];
    file_path=json['file_path'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['task_id'] = task_id;
    data['file_path']=file_path;
    return data;
  }
}
