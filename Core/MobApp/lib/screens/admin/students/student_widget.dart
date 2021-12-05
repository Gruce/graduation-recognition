// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          title: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff6875F5)),
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 235, 235, .8),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, .8),
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
                    )),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 235, 235, .8),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, .8),
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
                    )),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(235, 235, 235, .8),
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, .8),
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
                    ))
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(235, 235, 235, .8),
                  border: Border.all(
                    color: const Color.fromRGBO(235, 235, 235, .8),
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.photo_camera_outlined,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(camera,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(235, 235, 235, .8),
                  border: Border.all(
                    color: const Color.fromRGBO(235, 235, 235, .8),
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(time,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
          // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
        ),
      ),
    );
  }
}
