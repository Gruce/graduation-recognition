import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuctureWidget extends GetWidget {
  LuctureWidget({
    Key? key,
    required this.luctureName,
    required this.classroom,
    required this.startAt,
    required this.endAt,
    required this.day,
    required this.lucturerName,
    required this.section,
    required this.stage,
    required this.unit,
  }) : super(key: key);

  String luctureName;
  String classroom;
  String startAt;
  String endAt;
  String day;
  String lucturerName;
  String section;
  String stage;
  String unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // shadowColor: Colors.black12,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
      child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1)),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            title: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lucturerName,
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
                        luctureName,
                        style: const TextStyle(
                          color: Color(0xff6875F5),
                          fontSize: 13,
                        ),
                      ))
                ],
              ),
            ),
            subtitle: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(235, 235, 235, .5),
                          border: Border.all(
                            color: const Color.fromRGBO(235, 235, 235, .0),
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  5.0) //                 <--- border radius here
                              ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.first_page,
                                        color: Colors.black54,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                          startAt.isNotEmpty
                                              ? startAt
                                              : "No Start Time",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.last_page,
                                        color: Colors.black54,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                          endAt.isNotEmpty
                                              ? endAt
                                              : "No End Time",
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          )),
                                    ],
                                  ),
                                ])),
                            Row(
                              children: [
                                const Icon(
                                  Icons.view_day,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                                Text(day.isNotEmpty ? day : "No day",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    )),
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                  ),
                                  Text(
                                      classroom.isNotEmpty
                                          ? classroom
                                          : "No classroom",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(235, 235, 235, .5),
                          border: Border.all(
                            color: const Color.fromRGBO(235, 235, 235, .0),
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  5.0) //                 <--- border radius here
                              ),
                        ),
                        child: Row(
                          children: [
                            Text(section.isNotEmpty ? section : "No Stage",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                )),
                            const SizedBox(width: 20),
                            Text(stage.isNotEmpty ? stage : "No Stage",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                )),
                            const SizedBox(width: 20),
                            Text(unit.isNotEmpty ? unit : "No Unit",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ))
              // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
            ]),
          )),
    );
  }
}
