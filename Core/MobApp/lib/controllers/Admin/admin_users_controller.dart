import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduaiton_app/models/person.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AdminUsersController extends GetxController {
  late SharedPreferences prefs;
  RxList users = <UserModel>[].obs;
  RxList filteredUsers = <UserModel>[].obs;

  @override
  void onInit() async {
    fetch();
    super.onInit();
  }

  @override
  void dispose() {
    filteredUsers.assignAll(users);
    super.dispose();
  }

  void fetch() async{
    var res = await Utilities.httpGet('admin/users');
    if (res.statusCode == 200) {
      List response = json.decode(res.body)['data'];
      for (var element in response) {
        users.add(UserModel.fromJson(element));
      }
    }
    filteredUsers.assignAll(users);
    update();
  }
  void search(text) {
    if (text.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(users
          .where((user) =>
              user.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
    update();
  }
}
