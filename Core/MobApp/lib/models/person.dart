class PersonModel {
  int id = 0;
  String name = '';
  int trainingId = 1;
  int type = 0;

  PersonModel({id, name, trainingId, type});

  PersonModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    trainingId = json['training_id'];
    type = json['type'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['training_id'] = trainingId;
    data['type'] = type;
    return data;
  }
}
