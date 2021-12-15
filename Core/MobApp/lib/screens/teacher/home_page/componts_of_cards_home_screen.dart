import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/notification/notification_screen.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:graduaiton_app/util/utilities.dart';

class ComponentHomeScreen extends GetView<TeacherHomeController> {
  ComponentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(label: "Stop Lecture", onTap: controller.startLecture),

        SizedBox(
          height: 230,
          child: Stack(
            children: [
              Positioned(
                  top: 25,
                  left: 10,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.82,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  )),
              Positioned(
                  top: 0,
                  left: 20,
                  child: Card(
                    elevation: 0.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/teacher.jpg"),
                          )),
                    ),
                  )),
              Positioned(
                  top: 60,
                  left: 200,
                  child: Container(
                    height: 150,
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: Utilities.getUser,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                UserModel user = snapshot.data as UserModel;
                                print(user);
                                return Text(
                                  user.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                );
                              }else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                        Text(
                          "Computer Vison",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                        Text(
                          "Computer Science Department",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
///////////////////////////////////////

        //////////////////////////////
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 1.4,
          physics:
              const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 25,
                        left: 10,
                        child: Material(
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/Attendance.jpg"),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 50,
                        left: 90,
                        child: Container(
                          height: 150,
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attendance",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherProfileScreen()),
                );
              },
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 25,
                        left: 10,
                        child: Material(
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/profile1.png"),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 50,
                        left: 90,
                        child: Container(
                          height: 150,
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherProfileScreen()),
                );
              },
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 25,
                        left: 10,
                        child: Material(
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/schedule.jpg"),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 50,
                        left: 90,
                        child: Container(
                          height: 150,
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Schedule",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherNotification()),
                );
              },
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 25,
                        left: 10,
                        child: Material(
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/settings.png"),
                                )),
                          ),
                        )),
                    Positioned(
                        top: 50,
                        left: 90,
                        child: Container(
                          height: 150,
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        )
        // DatePicker(
        //   DateTime.now(),
        //   height: 100,
        //   width: 80,
        //   initialSelectedDate: DateTime.now(),
        //   selectionColor: const Color.fromRGBO(66, 80, 200, 1),
        //   selectedTextColor: Colors.white,
        // ),
      ],
    );
  }
}
