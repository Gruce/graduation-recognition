import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_lectures_controller.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/lecture_days_filter_controller.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';

// ignore: must_be_immutable
class LectureAbsencesFilterWidget extends GetView {
  LectureAbsencesFilterWidget({Key? key,required this.lecturesController})
      : super(key: key);
  @override
  AdminLecturesController controller = AdminLecturesController();
  LucturesController lecturesController;

  @override
  Widget build(BuildContext context) {
    return Obx(
              () => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(255, 255, 255, .3)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        controller.lectures.isNotEmpty
                            ? Container(
                                child: DropdownButton(
                                underline: Container(),
                                // Initial Value
                                value: controller.lectureSelectedIndex.value,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),
                                // Array list of items
                                items: controller.lectures
                                    .asMap()
                                    .keys
                                    .map((int index) {
                                  return DropdownMenuItem(
                                    value: index,
                                    child: Text(controller.lectures[index].name,
                                        style: const TextStyle(
                                            color: Color(0xff6875F5),
                                            fontSize: 12.3)),
                                  );
                                }).toList(),
                                onChanged: (Object? index) => {
                                  controller.filterByLecture(
                                      int.parse(index.toString()))
                                },
                              ))
                            : const Text("Loading"),
                      ])),
            );
  }
}
