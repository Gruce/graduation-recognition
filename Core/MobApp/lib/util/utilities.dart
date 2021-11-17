import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  static Future<UserModel> getUser = Future(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = json.decode(prefs.getString('user') ?? '');
    return UserModel.fromJson(data);
  });
}
