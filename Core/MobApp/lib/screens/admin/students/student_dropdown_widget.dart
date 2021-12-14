import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_stages_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_units_controller.dart';

// ignore: must_be_immutable
class StudentsDropDownWidget extends GetView {
  StudentsDropDownWidget({Key? key}) : super(key: key);
  @override
  AdminSectionsController controller = Get.put(AdminSectionsController());
  AdminStagesController controllerr = Get.put(AdminStagesController());
  AdminUnitsController controlleerr = Get.put(AdminUnitsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        border: Border.all(
          color: Colors.white.withOpacity(1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Obx(
        () => Row(children: <Widget>[
          // const Text("Section "),
          controller.sections.isNotEmpty
              ? DropdownButton(
                  // Initial Value
                  value: controller.sectionSelectedIndex.value,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: controller.sections.asMap().keys.map((int index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(controller.sections[index].name,
                          style: const TextStyle(
                              color: Color(0xff6875F5), fontSize: 12.3)),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Object? index) =>
                      {controller.filterBySection(int.parse(index.toString()))},
                )
              : const Text("Loading"),

          // const Text("Stage "),
          controllerr.stages.isNotEmpty
              ? DropdownButton(
                  // Initial Value
                  value: controllerr.stageSelectedIndex.value,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items:
                      controllerr.filteredStages.asMap().keys.map((int index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(controllerr.filteredStages[index].name,
                          style: const TextStyle(
                              color: Color(0xff6875F5), fontSize: 12.3)),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Object? index) => {
                    controllerr.filterByStage(
                      int.parse(index.toString()),
                    )
                  },
                )
              : const Text("Loading"),

          controlleerr.units.isNotEmpty
              ? DropdownButton(
                  // Initial Value
                  value: controlleerr.unitSelectedIndex.value,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items:
                      controlleerr.filteredUnits.asMap().keys.map((int index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(controlleerr.filteredUnits[index].name,
                          style: const TextStyle(
                              color: Color(0xff6875F5), fontSize: 12.3)),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Object? index) =>
                      {controlleerr.filterByUnit(int.parse(index.toString()))},
                )
              : const Text("Loading"),
        ]),
      ),
    );
  }
}
