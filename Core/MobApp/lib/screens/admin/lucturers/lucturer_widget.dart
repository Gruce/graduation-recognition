import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherWidget extends GetWidget {
  TeacherWidget(
      {Key? key,
      required this.name,
      required this.type,
      required this.speciality,
      required this.sectionName,
      required this.camera,
      required this.time,
    })
      : super(key: key);

  String name;
  int type;
  String speciality;
  String camera;
  String sectionName;
  String time;


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
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          title: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18,color: Color(0xff6875F5)),
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
                      speciality,
                      style: const TextStyle(
                        fontSize: 14,
                        color:Color(0xff6875F5) ,
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
                  children: const [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(
                      // camera.isNotEmpty ? camera :
                       "No camera",
                        style: TextStyle(
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
                  children: const [
                    Icon(
                      Icons.schedule,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(
                      // time.isNotEmpty ? time :
                     "Not seen yet",
                        style: TextStyle(
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
                  children:[
                    const Icon(
                      Icons.store_mall_directory_outlined,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(
                      // time.isNotEmpty ? time :
                     sectionName,
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
