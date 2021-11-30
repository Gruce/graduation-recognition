import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';

class AdminBottomNavigationBar extends GetWidget {
  AdminBottomNavigationBar({Key? key}) : super(key: key);

  @override
  AdminLayoutController controller = Get.put(AdminLayoutController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.onItemTap(index),
          selectedItemColor: const Color(0xff6875F5),
          selectedFontSize: 13.0,
          showUnselectedLabels: false,
          items: controller.tabs
              .map((element) => BottomNavigationBarItem(
                    icon: Icon(
                      element['icon'],
                    ),
                    label: element['title'],
                  ))
              .toList(),
        ));
  }
}
