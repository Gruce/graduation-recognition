import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_sections_controller.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_stages_controller.dart';
import 'package:graduaiton_app/controllers/Admin/lectures_controller/luctures_dropdown_controllers/lectures_units_controller.dart';


import 'luctures_controller.dart';

// ignore: must_be_immutable
class LuctureDropDownWidget extends GetView {
  LuctureDropDownWidget({Key? key, required this.controller1}) : super(key: key);

  LecturesSectionsController sectionController = Get.put(LecturesSectionsController());
  LecturesStagesController stageController = Get.put(LecturesStagesController());
  LecturesUnitsController unitController = Get.put(LecturesUnitsController());

  LucturesController controller1;

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
                sectionController.sections.isNotEmpty?
                 Container(
                        child: DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: sectionController.sectionSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items:
                           sectionController.sections.asMap().keys.map((int se) {
                          return DropdownMenuItem(
                            value: se,
                            child: Text(sectionController.sections[se].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? se) =>  {
                          sectionController.filterBySection(int.parse(se.toString()))
                        },
                      ))
                    : const Text("Loading"),
                // const Text("Stage "),
                stageController.stages.isNotEmpty?
                 DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: stageController.stageSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items:stageController.stages.asMap().keys.map((int st) {
                          return DropdownMenuItem(
                            value: st,
                            child: Text(stageController.filteredStages[st].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                        onChanged: (Object? st) =>  {
                          stageController
                              .filterByStage(int.parse(st.toString()))
                        },
                      )
                    : const Text("Loading"),

                unitController.units.isNotEmpty?
                 DropdownButton(
                        underline: Container(),
                        // Initial Value
                        value: unitController.unitSelectedIndex.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items:unitController.units.asMap().keys.map((int u) {
                          return DropdownMenuItem(
                            value: u,
                            child: Text(unitController.filteredUnits[u].name,
                                style: const TextStyle(
                                    color: Color(0xff6875F5), fontSize: 12.3)),
                          );
                        }).toList(),
                          onChanged: (Object? u) =>{
                          unitController
                              .filterByUnit(int.parse(u.toString()))
                        }
                        ,
                      )
                    : const Text("Loading"),
              ])),
    );
  }
}
