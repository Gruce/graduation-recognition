import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';


class AdminPeopleController extends GetxController {
  late SharedPreferences prefs;
  RxList people = <UserModel>[].obs;
  RxList filteredPeople = <UserModel>[].obs;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  @override
  void dispose() {
    filteredPeople.assignAll(people);
    super.dispose();
  }

  void fetch() async{
    var res = await Utilities.httpGet('admin/users');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        people.add(UserModel.fromJson(element));
      }
    }
    filteredPeople.assignAll(people);
    update();
  }
  void search(text) {
    if (text.isEmpty) {
      filteredPeople.assignAll(people);
    } else {
      filteredPeople.assignAll(people
          .where((person) =>
              person.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
    update();
  }
}
