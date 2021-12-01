import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonWidget extends GetWidget {
  PersonWidget(
      {Key? key,
      required this.name,
      required this.type,
      required this.camera,
      required this.time})
      : super(key: key);

  String name;
  int type;
  String camera;
  String time;

  @override
  Widget build(BuildContext context) {
    var typeText = "";
    switch (type) {
      case 0:
        typeText = "Visitor";
        break;
      case 1:
        typeText = "Student";
        break;
      case 2:
        typeText = "Employer";
        break;
    }

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
                  style: const TextStyle(fontSize: 18),
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
                      typeText,
                      style: const TextStyle(
                        fontSize: 14,
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
                  borderRadius: BorderRadius.all(Radius.circular(
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
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
