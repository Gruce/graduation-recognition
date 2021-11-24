// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff6875F5),
              Color(0xff4656CC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome To Smart Tracker App",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //   Text(
                        //   "Lecturer Login",
                        //   style: TextStyle(
                        //     color: Color(0xff13097c),
                        //     fontSize: 30.0,
                        //     fontWeight: FontWeight.w900,
                        //   ),
                        // ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: controller.email,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.black.withOpacity(.6)),
                            hintText: ('Enter your email'),
                            hintStyle: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black.withOpacity(.5)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xff6875F5),
                            ),
                            // Here is key idea
                          ),
                        ),
                        SizedBox(height: 15),
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            keyboardType: TextInputType.text,
                            obscureText: !controller.passwordVisible.value,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black.withOpacity(.5)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff6875F5),
                              ),
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: controller.passwordVisible.value
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  controller.passwordVisible.value =
                                      !controller.passwordVisible.value;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xff6875F5),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () async => await controller.login(),
                            child: Text(
                              "Login",
                              style: GoogleFonts.openSans(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
