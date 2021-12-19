// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/sidebar/sidebar_controller.dart';
import 'package:graduaiton_app/screens/general/notification/general_notification.dart';


class AdminSidebarScreen extends GetWidget {
  AdminSidebarScreen({Key? key}) : super(key: key);

  @override
  AdminSidebarController controller = Get.put(AdminSidebarController());

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
                        controller.user.name.isNotEmpty
                            ? ListTile(
                                title: Text(
                                  controller.user.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                                onTap: () => Get.toNamed(Routes.adminProfile, arguments: controller.user),
                                subtitle: Text(
                                  controller.user.typeString,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  child: Image(image: AssetImage('assets/STLogo.png')),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
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
