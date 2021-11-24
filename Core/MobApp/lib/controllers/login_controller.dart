import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduaiton_app/main.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final api = dotenv.env['API'];

  Future login(context, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var res = await http.post(Uri.parse("$api/auth/login"),
        body: {"email": email, "password": password});
    if (res.statusCode == 200) {
      // Set token to shared preferences (local storage)
      String jwt = 'Bearer ' + json.decode(res.body)['access_token'];
      await prefs.setString('jwt', jwt);

      // Set User Details
      setUserDetails(jwt);
      // Navigate to home page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
        (Route<dynamic> route) => false,
      );
    } else {
      // Show error dialog
      Utilities.displayDialog(context, "Error", "Wrong Username or Password");
    }
  }

  Future setUserDetails(String jwt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http
        .post(Uri.parse("$api/auth/me"), headers: {"Authorization": jwt});
    if (res.statusCode == 200) {
      Map data = json.decode(res.body);
      String user = json.encode(UserModel.fromJson(data));
      await prefs.setString('user', user);
    }
  }
}
