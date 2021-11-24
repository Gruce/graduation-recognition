import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/admin/home_page/home_screen.dart';
import 'screens/admin/nav_bar/nav_bar.dart';

import 'package:get/get.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Graduation App',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        getPages: Routes.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context)
              .textTheme
              .apply(displayColor: const Color(0xFF222B45)),
          // fontFamily: "Pacifico",
        ));
    //   home: FutureBuilder(
    //       future: jwtOrEmpty,
    //       builder: (context, snapshot) {
    //         if (!snapshot.hasData) return const CircularProgressIndicator();
    //         if (snapshot.data != "") {
    //           var str = snapshot.data.toString();
    //           var jwt = str.split(".");

    //           if (jwt.length != 3) {
    //             return const LoginScreen();
    //           } else {
    //             return const Nav();
    //           }
    //         } else {
    //           return const LoginScreen();
    //         }
    //       }),
    //   //  home: const SplashScreen(),
    // );
  }
}
