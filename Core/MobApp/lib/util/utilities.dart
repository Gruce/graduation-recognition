import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

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
    final api = await Config.api;
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

  static Future httpPost(String path, var data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final api = await Config.api;
    var res = await http.post(Uri.parse("$api/$path"),
        body: data,
        headers: {"Authorization": prefs.getString('jwt').toString()});
    return res;
  }

  static Future httpFilesPost(
      String path, Map<dynamic, dynamic> data, List files) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final api = await Config.api;

    http.MultipartRequest request =
        http.MultipartRequest("POST", Uri.parse("$api/$path"));

    for (var file in files) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('files[]', file);

      request.files.add(multipartFile);
    }

    for (var entry in data.entries) {
      request.fields[entry.key] = entry.value;
    }

    request.headers
        .addAll({"Authorization": prefs.getString('jwt').toString()});

    http.StreamedResponse response = await request.send();

    print(response.statusCode);
    print(await response.stream.bytesToString());
  }

  static Future httpGet(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final api = await Config.api;
    var res = await http.get(Uri.parse("$api/$path"),
        headers: {"Authorization": prefs.getString('jwt').toString()});
    return res;
  }
}
