import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/lectures_controller/lecture_days_filter_controller.dart';


// ignore: must_be_immutable
class DaysFilterWidget extends GetView {
  DaysFilterWidget({Key? key})
      : super(key: key);
  @override
  DayFilterController controller = Get.put(DayFilterController());
  

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
               controller.days.isNotEmpty
                    ? Container(
                        child: DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: controller.daySelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items:
                            controller.days.asMap().keys.map((int index) {
                          return DropdownMenuItem(
                            value: index,
                            child: Text(controller.days[index].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? index) => {
                          controller
                              .filterByDay(int.parse(index.toString()))
                        },
                      ))
                    : const Text("Loading"),
              ])),
    );
  }
}
