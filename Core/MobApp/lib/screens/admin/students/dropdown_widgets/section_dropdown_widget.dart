import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';

// ignore: must_be_immutable
class SectionsDropDownWidget extends GetView {
  SectionsDropDownWidget({Key? key}) : super(key: key);
  @override
  AdminSectionsController controller = Get.put(AdminSectionsController());
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
          Obx(() => Expanded(
            child: 
              controller.sections.isNotEmpty ?
              DropdownButton(
                // Initial Value
                value: controller.sections[controller.sectionSelectedIndex.value],
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: controller.sections.asMap().keys.map((int index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(controller.sections[index].name.toString(),
                        style: const TextStyle(color: Color(0xff6875F5))),
                  );
                }).toList(),
                  
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (Object? section) => {
                  controller.sectionSelectedIndex.value = int.parse(section.toString())
                },
              ) : const Text("Loading")
          ))
        ],
      ),
    );
  }
}
