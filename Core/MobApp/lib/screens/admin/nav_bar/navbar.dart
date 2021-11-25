import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_layout_controller.dart';

// ignore: must_be_immutable
class AdminBottomNavigationBar extends StatelessWidget {
  AdminBottomNavigationBar({Key? key}) : super(key: key);

  AdminLayoutController controller = Get.put(AdminLayoutController());

  void _onItemTap(int index) {
    print(index);
    controller.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color(0xff6875F5),
          ),
          // ignore: deprecated_member_use
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xff6875F5)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.table_view,
            color: Color(0xff6875F5),
          ),
          title: Text(
            'Tables',
            style: TextStyle(color: Color(0xff6875F5)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.schedule,
            color: Color(0xff6875F5),
          ),
          title: Text(
            'Schedule',
            style: TextStyle(color: Color(0xff6875F5)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Color(0xff6875F5),
          ),
          title: Text(
            'Add New',
            style: TextStyle(color: Color(0xff6875F5)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color(0xff6875F5),
          ),
          title: Text(
            'Profile',
            style: TextStyle(color: Color(0xff6875F5)),
          ),
        ),
      ],
      currentIndex: controller.selectedIndex.value,
      onTap: _onItemTap,
      selectedFontSize: 13.0,
      unselectedFontSize: 13.0,
    );
  }
}
