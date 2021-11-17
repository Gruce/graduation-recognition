import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduaiton_app/screens/login_screen.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 0), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(opacity: 0.8, child: Image.asset('bb.png')),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff6875F5),
              highlightColor: Colors.black.withOpacity(.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  'STLogo.png',
                  width: 400,
                  height: 250,
                ),
                //  style: TextStyle(
                //   fontFamily: 'Pacifico',
                //   fontSize: 50.0,
                //   shadows: <Shadow>[
                //     Shadow(
                //       blurRadius: 10.0,
                //       color: Colors.black87,
                //       offset: Offset.fromDirection(120, 12)
                //     )
                //   ]
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
