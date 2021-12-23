 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/luctures_dropdown_controllers/lectures_sections_controller.dart';
import 'package:graduaiton_app/controllers/Admin/luctures_dropdown_controllers/lectures_stages_controller.dart';
import 'package:graduaiton_app/controllers/Admin/luctures_dropdown_controllers/lectures_units_controller.dart';


import 'luctures_controller.dart';

// ignore: must_be_immutable
class LuctureDropDownWidget extends GetView {
  LuctureDropDownWidget({Key? key, required this.controlleer}) : super(key: key);
  @override
  LecturesSectionsController controller = Get.put(LecturesSectionsController());
  LecturesStagesController stageController = Get.put(LecturesStagesController());
  LecturesUnitsController unitController = Get.put(LecturesUnitsController());

  LucturesController controlleer;
  // LecturesSectionsController controlleeer;
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
                controller.sections.isNotEmpty
                    ? Container(
                        child: DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: controller.sectionSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items:
                            controller.sections.asMap().keys.map((int index) {
                          return DropdownMenuItem(
                            value: index,
                            child: Text(controller.sections[index].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? index) => {
                          controller
                              .filterBySection(int.parse(index.toString()))
                        },
                      ))
                    : const Text("Loading"),
                // const Text("Stage "),
                stageController.stages.isNotEmpty
                    ? DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: stageController.stageSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: stageController.filteredStages
                            .asMap()
                            .keys
                            .map((int index) {
                          return DropdownMenuItem(
                            value: index,
                            child: Text(stageController.filteredStages[index].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? index) => {
                          stageController.filterByStage(
                            int.parse(index.toString()),
                          )
                        },
                      )
                    : const Text("Loading"),

                unitController.units.isNotEmpty
                    ? DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: unitController.unitSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: unitController.filteredUnits
                            .asMap()
                            .keys
                            .map((int index) {
                          return DropdownMenuItem(
                            value: index,
                            child: Text(unitController.filteredUnits[index].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? index) => {
                          unitController.filterByUnit(int.parse(index.toString()))
                        },
                      )
                    : const Text("Loading"),
              ])),
    );
  }
}
