class UserModel {
  int id = 0;
  String name = '';
  String email = '';
  int type = 0;
  String typeString = '';

  UserModel({id, name, email, type});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    typeString = getTypeString(type);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['type'] = type;
    return data;
  }

  String getTypeString(int type){
    switch (type){
      case 1:
        return "Admin";
      case 2:
        return "Lecturer";
      case 3:
        return "Student";
    }
    return "Unknown";
  }
}
