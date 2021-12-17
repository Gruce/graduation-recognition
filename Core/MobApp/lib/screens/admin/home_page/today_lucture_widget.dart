import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuctureWidget extends GetWidget {
  LuctureWidget({
    Key? key,
    required this.luctureName,
    required this.hall,
    required this.startAt,
    required this.endAt,
    required this.lucturerName,
    required this.section,
    required this.stage,
    required this.unit,
  }) : super(key: key);

  String luctureName;
  String hall;
  String startAt;
  String endAt;
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
                      margin: const EdgeInsets.only(right: 18.0),
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
            subtitle:
                Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.725,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.first_page,
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                  SizedBox(width: 3),
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
                              SizedBox(width: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.last_page,
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                  SizedBox(width: 3),
                                  Text(endAt.isNotEmpty ? endAt : "No End Time",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      )),
                                ],
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.highlight_alt,
                              size: 14,
                            ),
                            SizedBox(width: 3),
                            Text(hall.isNotEmpty ? hall : "No End Time",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.725,
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              color:Colors.black54,
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
              ),
              // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
            ]),
          )),
    );
  }
}
