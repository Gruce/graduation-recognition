// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/teacher/notification/notification_screen.dart';
import 'package:graduaiton_app/screens/teacher/sidebar/sidebar_controller.dart';
import 'package:graduaiton_app/util/utilities.dart';

class TeacherSidebarScreen extends GetWidget {
  TeacherSidebarScreen({Key? key}) : super(key: key);

  @override
  TeacherSidebarController controller = Get.put(TeacherSidebarController());
  TeacherProfileController controller1 = Get.put(TeacherProfileController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xff6875F5),
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xff6875F5),
                      child: Column(children: <Widget>[
                        ListTile(
                          title: FutureBuilder(
                            future: Utilities.getUser,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                UserModel user = snapshot.data as UserModel;
                                return Text(
                                  user.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),

                          subtitle: Text(
                            controller1.teacher.value.speciality,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          // leading: CircleAvatar(
                          //   child: Image.asset('STLogo.png'),
                          //   backgroundColor: Colors.white,
                          //   // child: Icon(
                          //   //   Icons.perm_identity,
                          //   //   color: Colors.white,
                          //   // ),
                          //   radius: 17,
                          // ),
                        ),
                        Divider(
                          height: 50,
                          thickness: 0.6,
                          color: Colors.white.withOpacity(0.7),
                          indent: 22,
                          endIndent: 32,
                        ),
                        ListView.builder(
                            itemCount: controller.tabs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => Card(
                                  elevation: 0,
                                  color: const Color(0xff6875F5),
                                  child: ListTile(
                                    title: Text(
                                      controller.tabs[i]['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    leading: Icon(
                                      controller.tabs[i]['icon'],
                                      color: Colors.white,
                                    ),
                                    selected: true,
                                    onTap: () => {controller.onItemTap(i)},
                                  ),
                                )),
                        Card(
                          elevation: 0,
                          color: const Color(0xff6875F5),
                          child: ListTile(
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            leading: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            selected: true,
                            onTap: () => controller.logOut(),
                          ),
                        )
                      ])),
                ]))));
  }
}
