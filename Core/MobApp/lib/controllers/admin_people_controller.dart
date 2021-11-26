import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class AdminPeopleController extends GetxController {
  late SharedPreferences prefs;
  List people = [];
  List filteredpeople = [].obs;
  final api = Config.api;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    var res = await http.get(Uri.parse("$api/people"),
        headers: {"Authorization": prefs.getString('jwt').toString()});
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        people.add(PersonModel.fromJson(element));
      }
    }
    filteredpeople = people;
  }
  void search(text) {
    if (text.isEmpty) {
      filteredpeople = people;
    } else {
      filteredpeople = people
          .where((person) =>
              person.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }
}
