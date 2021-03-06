import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';

// ignore: must_be_immutable
class StudentSearchWidget extends GetView {
  StudentSearchWidget({Key? key}) : super(key: key);

  @override
  TeacherStudentsUnitController controller =
      Get.put(TeacherStudentsUnitController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        border: Border.all(
          color: Colors.white.withOpacity(1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => controller.search(value),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search by Name",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                isDense: true,
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
