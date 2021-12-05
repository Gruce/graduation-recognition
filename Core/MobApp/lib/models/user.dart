class UserModel {
  int id = 0;
  String name = '';
  String email = '';
  String type = '';

  UserModel({id, name, email, type});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['type'] = type;
    return data;
  }
}
