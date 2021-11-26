import 'package:flutter/material.dart';
import 'package:graduaiton_app/routes/routes.dart';

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
  }
}
