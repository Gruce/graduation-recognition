import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonProfileController extends GetxController {
  late SharedPreferences prefs;

  void onInit() async {
    prefs = await SharedPreferences.getInstance();

    // print(Get.parameters['id']);
    super.onInit();
  }

  Future<PersonModel> getUserById(id) async {
    var res = await Utilities.httpPost("person", {"id": id.toString()});
    PersonModel person = PersonModel();
    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body)['data'];
      person = PersonModel.fromJson(data);
    }
    return person;
  }

  String personType(var type) {
    switch (type) {
      case 0:
        return "Visitor";
      case 1:
        return "Student";
      case 2:
        return "Employer";
    }
    return "Unknown";
  }
}
