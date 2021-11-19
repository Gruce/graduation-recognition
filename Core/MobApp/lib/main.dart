import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/admin/home_page/home_screen.dart';
import 'screens/admin/nav_bar/nav_bar.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  // SharedPreferences.setMockInitialValues({});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> get jwtOrEmpty async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context)
            .textTheme
            .apply(displayColor: const Color(0xFF222B45)),
        // fontFamily: "Pacifico",
      ),
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data.toString();
              var jwt = str.split(".");

              if (jwt.length != 3) {
                return const LoginScreen();
              } else {
                return const Nav();
              }
            } else {
              return const LoginScreen();
            }
          }),
      //  home: const SplashScreen(),
    );
  }
}
