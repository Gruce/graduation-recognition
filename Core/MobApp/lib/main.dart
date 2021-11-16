import 'package:flutter/material.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'package:graduaiton_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Graduation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: "Pacifico",
      ),
      home: const SplashScreen(),
    );
  }
}
