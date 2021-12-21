class DayModel {
  int id = 0;
  String name = '';


  DayModel({id, name});

  DayModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];

  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}


