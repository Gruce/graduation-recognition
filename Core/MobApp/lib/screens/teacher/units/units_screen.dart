import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_units_controller.dart';
import 'package:graduaiton_app/models/user.dart';

import '../layout.dart';

class TeacherUnitsScreen extends GetView {
  TeacherUnitsScreen({Key? key}) : super(key: key);

  @override
  TeacherUnitsController controller = Get.put(TeacherUnitsController());

  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Units',
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => {},
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xffd4d8ff),
                    borderRadius:BorderRadius.circular(20),
                  ),
                    child:
                Column(
                  children: [
                    ListTile(
                      title: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(7.5),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff6875F5),
                                  ),
                                  child: const Text('A', style: TextStyle(color: Colors.white),),
                                ),
                                const Text('Fourth Stage'),
                              ]),
                          const Text('Subject Title'),
                        ],
                      )),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '50 Students',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          Text(
                            '1 Hour to begin',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),

                          // Container(
                          //   padding: const EdgeInsets.all(5),
                          //   margin: const EdgeInsets.only(right: 5),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: const Color(0xffcccccc),
                          //   ),
                          //   child: Icon(Icons.arrow_right_alt_rounded),
                          // ),
                        ],
                      )
                      
                    ),
                  ],
                ))
              ),
            )
          ],
        )));
  }
}
