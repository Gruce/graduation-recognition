import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Utilities {
  static void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  static Future<UserModel> get getUser async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = json.decode(prefs.getString('user') ?? '');
    return UserModel.fromJson(data);
  }

  static Future<UserModel> getUserById(id) async {
    final api = dotenv.env['API'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwt = prefs.getString('jwt').toString();

    var res = await http.post(Uri.parse("$api/person"),
        body: {"id": id.toString()}, headers: {"Authorization": jwt});

    UserModel user = UserModel();

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body)['data'];
      user = UserModel.fromJson(data);
    }

    return user;
  }
}
