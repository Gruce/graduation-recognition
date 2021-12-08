import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_stages_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_units_controller.dart';

// ignore: must_be_immutable
class SectionsDropDownWidget extends GetView {
  SectionsDropDownWidget({Key? key}) : super(key: key);
  @override
  AdminSectionsController controller = Get.put(AdminSectionsController());
  AdminStagesController controllerr = Get.put(AdminStagesController());
  AdminUnitsController controllerrr = Get.put(AdminUnitsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          // const Text("Section "),
          Obx(() => Expanded(
              child: controller.sections.isNotEmpty
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
                      onChanged: (Object? index) => {
                        controller.filterBySection(int.parse(index.toString()))
                      },
                    )
                  : const Text("Loading"))),

          // const Text("Stage "),
          Obx(() => Expanded(
              child: controllerr.stages.isNotEmpty
                  ? DropdownButton(
                      // Initial Value
                      value: controllerr.stageSelectedIndex.value,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: controllerr.stages.asMap().keys.map((int index) {
                        return DropdownMenuItem(
                          value: index,
                          child: Text(controllerr.stages[index].name,
                              style: const TextStyle(
                                  color: Color(0xff6875F5), fontSize: 12.3)),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (Object? index) => {
                        controllerr.filterByStage(int.parse(index.toString()))
                      },
                    )
                  : const Text("Loading"))),

          Obx(() => Expanded(
              child: controllerrr.units.isNotEmpty
                  ? DropdownButton(
                      // Initial Value
                      value: controllerrr.unitSelectedIndex.value,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: controllerrr.units.asMap().keys.map((int index) {
                        return DropdownMenuItem(
                          value: index,
                          child: Text(controllerrr.units[index].name,
                              style: const TextStyle(
                                  color: Color(0xff6875F5), fontSize: 12.3)),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (Object? index) => {
                        controllerrr.filterByUnit(int.parse(index.toString()))
                      },
                    )
                  : const Text("Loading")))
        ],
      ),
    );
  }
}
