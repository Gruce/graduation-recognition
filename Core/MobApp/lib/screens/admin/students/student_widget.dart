// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StudentWidget extends GetWidget {
  StudentWidget({
    Key? key,
    required this.user_id,
    required this.name,
    required this.section_name,
    required this.stage_name,
    required this.unit_name,
    required this.camera,
    required this.time,
  }) : super(key: key);
  int user_id;
  String name;
  String section_name;
  String stage_name;
  String unit_name;
  String camera;
  String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // shadowColor: Colors.black12,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff6875F5)),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.photo_camera_outlined,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(camera,
                                    style: const TextStyle(
                                        fontSize: 11,
                                       ))
                              ],
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(time,
                                    style: const TextStyle(
                                        fontSize: 11,
                                      )),
                              ],
                            ),
                          ],
                        )),
                  ])),

          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(235, 235, 235, .3),
                        border: Border.all(
                          color: const Color.fromRGBO(235, 235, 235, .3),
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      child: Text(
                        section_name,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(235, 235, 235, .3),
                        border: Border.all(
                          color: const Color.fromRGBO(235, 235, 235, .3),
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      child: Text(
                        stage_name,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(235, 235, 235, .3),
                        border: Border.all(
                          color: const Color.fromRGBO(235, 235, 235, .3),
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      child: Text(
                        unit_name,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
          // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
        ),
      ),
    );
  }
}
